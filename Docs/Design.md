# Design Decisions

**Core philosophy and architectural choices behind SwiftUIML.**

## Design Goals

### 1. Simple and Minimal

SwiftUIML focuses **exclusively** on rendering a data structure. It does not:
- Replace SwiftUI's APIs
- Provide its own layout engine
- Abstract away platform differences
- Introduce new UI paradigms

**Scope:** Define UI as a tree structure, render it as native SwiftUI.

### 2. DOM-Like Architecture

SwiftUIML's `Node` mirrors the DOM:

```swift
public struct Node: Codable, Identifiable, Hashable {
  public var type: ViewType
  public var attributes: Attributes   // OrderedMultiDictionary
  public var children: [Node]?
}
```

**Key differences from DOM:**
- Attributes are **ordered** and **allow duplicates**
- Duplicate keys enable chaining: `.frame(width: 100).frame(height: 200)` produces two `frame` attributes
- Order matters: `.padding().background()` != `.background().padding()`
- Immutable by default

### 3. Extensible Rendering System

Because the node tree is just data, rendering is a separate concern. Renderers can be added or overwritten without modifying core:

```swift
struct CustomButtonRenderer: ViewRenderer {
  static let type: ViewType = .button
  static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    // Custom implementation
  }
}

let customContext = RenderContext.default.with(CustomButtonRenderer.self)
NodeView(node).environment(\.renderContext, customContext)
```

Users are never blocked by missing features.

### 4. Lean Into Native APIs

Rather than abstracting away the underlying framework, SwiftUIML fully embraces SwiftUI. View types and modifiers map directly to their SwiftUI counterparts, so platform-specific features are first-class and there's no performance overhead from an intermediate layer. The trade-off is that rendering is iOS/macOS-only (via SwiftUI), but the data model and DSL work anywhere Swift runs, including Linux.

### 5. Zero External Dependencies

SwiftUIMLCore has **no external dependencies**. Only test suite uses `swift-snapshot-testing`.

**Benefits:**
- Smaller binary, faster compile times
- No dependency hell
- Platform-agnostic Core (works on Linux, embedded runtimes, etc.)

## Architecture Deep Dive

The following sections cover specific implementation decisions and the reasoning behind them.

### Equatable and Identifiable

#### Node Identity

```swift
public var id: String {
  attributes[AttributeKey.id]?.string ?? String(hashValue)
}
```

- IDs derived from `.id` attribute or hash
- Stable IDs via `.addingStableIds()`
- String type for meaningful IDs ("user-profile-123")

#### NodeView Equatability

```swift
public struct NodeView: View, Equatable {
  public var body: some View {
    let baseView = EquatableNodeBody(node: node, context: context, messageHandler: messageHandler)

    if node.attributes[.ignoreEquatable]?.bool == true {
      return AnyView(baseView)
    } else {
      return AnyView(baseView.equatable())
    }
  }
}
```

**Why `.equatable()` matters:**

SwiftUI's `.equatable()` uses structural equality for diffing. Critical for performance with dynamic UIs:

```swift
NodeView(node)  // With .equatable(): only re-renders when node changes
```

**Trade-off:** `.equatable()` changes type signature. Some contexts (List, ForEach, navigation) break with `EquatableView`.

**Solution:** `.ignoreEquatable()` modifier skips wrapping. ListNode automatically adds this to children.

### Recursive Rendering and Type Erasure

SwiftUI views have concrete types, but recursive structures need heterogeneous collections:

```swift
public protocol ViewRenderer {
  static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View
}
```

**Type erasure techniques:**
1. **Existential types (`any View`)**: Erases concrete types, allows heterogeneous collections
2. **AnyView wrapper**: Wraps EquatableView for body return type
3. **Renderer protocol**: Returns `any View`, lookup happens at runtime

**Performance:** Type erasure has costs (witness tables, heap allocation), but acceptable since:
- UI can't be known at compile time
- Actual SwiftUI rendering is still native
- Most bottlenecks are network, not rendering

### Immutability and Copy-on-Write

```swift
public func addingAttribute(_ key: AttributeKey, value: AttributeValue) -> Node {
  var updated = attributes
  updated.append(key, value)
  return Node(type: type, attributes: updated, children: children)
}
```

All modifications return new instances:
- Thread-safe (Sendable conformance)
- No accidental mutations
- Matches SwiftUI's value semantics
- Swift's copy-on-write keeps performance acceptable

### OrderedMultiDictionary: Design Choice

The choice of `OrderedMultiDictionary` is fundamental to SwiftUIML's design. A standard dictionary would lose both attribute order and the ability to have duplicate keys, both of which are required to faithfully represent SwiftUI modifier chains.

#### Why Order and Duplicates Matter

SwiftUI modifiers are **not commutative**:

```swift
Text("Hello").padding(10).background(Color.blue)
// vs
Text("Hello").background(Color.blue).padding(10)
// Different results!
```

SwiftUI allows multiple applications:

```swift
Text("Hello").frame(width: 100).frame(height: 50)
// Two separate frame modifiers
```

Standard dictionaries **cannot represent this**.

#### Requirements

1. **Preserve order** - Modifiers apply in sequence
2. **Allow duplicates** - Same key multiple times
3. **Support lookup** - Fast access by key
4. **Serialize cleanly** - Standard JSON

#### Implementation

```swift
public struct OrderedMultiDictionary<Key: Hashable, Value> {
  private var pairs: [(Key, Value)] = []

  subscript(key: Key) -> Value? {
    pairs.first { $0.0 == key }?.1  // O(n), returns first match
  }

  func allValues(for key: Key) -> [Value] {
    pairs.filter { $0.0 == key }.map { $0.1 }
  }
}
```

**JSON format (2D array):**
```json
[
  ["text", "Hello"],
  ["padding", 10],
  ["frame", {"width": 100}],
  ["frame", {"height": 50}]
]
```

**Performance:** O(n) lookup acceptable because:
- Nodes rarely have >20 attributes
- Rendering on state changes, not every frame
- Type erasure dominates performance cost anyway

#### Why Not Alternatives?

- **External dependency:** Violates "zero dependencies"
- **Custom JSON format:** More complex, harder to validate
- **Attribute numbering:** Fragile, requires re-numbering

### Layout and Style Resolution

`Layout` pairs a style dictionary with a content tree and resolves styles into concrete node attributes:

```swift
let layout = Layout(
  styles: [
    "card": [.padding: 16, .background: ColorNode("white"), .cornerRadius: 12],
    "card-highlighted": [.inherit: "card", .background: ColorNode("yellow")],
  ],
  content: VStackNode {
    TextNode("Normal").style("card")
    TextNode("Featured").style("card-highlighted")
  }
)

let resolved = layout.resolve()
```

**How resolution works:**

1. **Style inheritance** - Styles can reference other styles via `.inherit`. Resolution walks the inheritance chain, merging parent attributes into children. Circular references are detected and broken gracefully.
2. **Attribute merging** - Style attributes are inserted at the position of the `.style` key in the node's attribute list. Node attributes take precedence over style attributes when both define the same key.
3. **Recursive application** - `resolve()` walks the entire node tree, applying styles to every node that references one.

**Threading consideration:** `resolve()` is a pure data transformation on immutable `Node` values with no SwiftUI dependency. This makes it safe to run off the main actor, and for large or deeply nested layouts, you should:

```swift
let resolved = await Task.detached {
  layout.resolve()
}.value

NodeView(resolved) // Render the resolved tree on @MainActor
```

Style inheritance chains and recursive tree traversal can take non-trivial time on complex layouts. Keeping resolution off the main thread avoids blocking UI updates.

**TypeScript parity:** The TypeScript DSL provides an equivalent `Layout` class with the same style/content structure and JSON serialization. Resolution is Swift-side only since it's a rendering concern.

## Non-Goals

SwiftUIML is intentionally narrow in scope. What it **does not do:**

1. **Cross-Platform UI Abstraction** - SwiftUI only, not for Android/Web
2. **Layout Engine** - SwiftUI computes all layout
3. **Component Library** - Provides building blocks, not opinionated components
4. **State Management** - State lives in the host app
5. **Validation/Schema** - Invalid or unrecognized nodes render as `EmptyView`, keeping the system forgiving and forward-compatible

## Future Considerations

Potential additions if blocking issues arise:
- Index for OrderedMultiDictionary lookups (if profiling shows bottlenecks)
- Developer tools (runtime inspector, JSON validation)
- Additional platforms (macOS, watchOS, tvOS, visionOS)
