# Environment

**SwiftUI Environment integration for customizing rendering and messaging.**

## Overview

SwiftUIML uses SwiftUI's `@Environment` system to pass configuration down the view hierarchy:

1. **`renderContext`** - Registry of view and modifier renderers
2. **`messageQueue`** - Channel for host -> component messages

Most users won't need to touch either of these — the defaults cover all built-in SwiftUI views and modifiers. Custom configuration becomes useful when you need to add domain-specific views, override how a built-in type renders, or set up host-to-component communication.

## When Would You Need This?

- **Branded components**: Your design system has a custom button style that all `Button` nodes should use — override the default `ButtonRenderer`.
- **Domain-specific views**: Your app has a video player, map view, or chart that doesn't exist in SwiftUI's standard library — register a custom `ViewRenderer`.
- **Custom modifiers**: You want a `.glow()` or `.shimmer()` modifier that applies a specific visual effect — register a custom `ModifierRenderer`.
- **Host-to-component control**: You need to send commands to a rendered component (e.g., "play", "pause", "refresh") — set up a `MessageQueue`.

## Render Context

The `RenderContext` maps view types and attribute keys to renderer implementations.

### Default Context

```swift
NodeView(node) // Uses RenderContext.default automatically
```

Includes all built-in view and modifier renderers.

### Custom Renderers

Override or add renderers:

```swift
struct CustomButtonRenderer: ViewRenderer {
  static let type: ViewType = .button

  static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    Text(node.attributes[.title]?.string ?? "")
      .padding()
      .background(Color.purple)
  }
}

let customContext = RenderContext.default.with(CustomButtonRenderer.self)

NodeView(node)
  .environment(\.renderContext, customContext)
```

### Adding New View Types

```swift
struct VideoPlayerRenderer: ViewRenderer {
  static let type: ViewType = .custom("VideoPlayer")

  static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    VideoPlayerView(url: node.attributes[.url]?.url)
      .applyModifiers(node, context: context, handler: messageHandler)
  }
}

let context = RenderContext.default.with(VideoPlayerRenderer.self)
```

### Adding Custom Modifiers

```swift
struct GlowModifierRenderer: ModifierRenderer {
  static let key: AttributeKey = .custom("glow")

  static func apply(to view: any View, node: borrowing Node, value: AttributeValue, messageHandler: MessageHandler?) -> (any View)? {
    guard let color = value.string else { return nil }
    return view.shadow(color: Color(hex: color), radius: 10)
  }
}

let context = RenderContext.default.with(GlowModifierRenderer.self)
```

### Context Inheritance

RenderContext follows SwiftUI's environment propagation:

```swift
VStack {
  NodeView(node1) // Uses custom context
  NodeView(node2)
    .environment(\.renderContext, .default) // Override
  NodeView(node3) // Uses custom context again
}
.environment(\.renderContext, customContext)
```

## Message Queue

The `MessageQueue` enables **host -> component** communication.

### Setup

```swift
struct ContentView: View {
  let messageQueue = MessageQueue()

  var body: some View {
    NodeView(node) { message in
      handleOutboundMessage(message)
    }
    .environment(\.messageQueue, messageQueue)
  }

  func controlComponent() {
    messageQueue.send(.dict([
      .nodeId: .string("videoPlayer.0"),
      .message: .dict([.custom("action"): .string("play")])
    ]))
  }
}
```

### Receiving Messages

Components use `.onMessage(nodeId:)` to listen:

```swift
struct VideoPlayerView: View {
  let node: Node
  @State private var isPlaying = false

  var body: some View {
    VideoPlayer(...)
      .onMessage(nodeId: node.id) { message in
        guard let action = message.dict?[.custom("action")]?.string else { return }
        switch action {
        case "play": isPlaying = true
        case "pause": isPlaying = false
        default: break
        }
      }
  }
}
```

More details are available in the [Messages Guide](Messages.md)
