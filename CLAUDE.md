# CLAUDE.md

Project instructions for Claude Code.

## Project Overview

SwiftUIML is a data-driven SwiftUI rendering framework. UI is defined as a tree of `Node` objects (type, attributes, children) and rendered as native SwiftUI views. Nodes serialize to JSON for server-driven UI, A/B testing, and runtime layout changes.

## Repository Structure

```
Sources/
  SwiftUIMLCore/          # Platform-agnostic data model and DSL (iOS, macOS, Linux)
    Node.swift            # Core immutable data structure
    AttributeKey.swift    # All attribute keys (view props + modifiers)
    AttributeValue.swift  # Type-safe attribute values
    ViewType.swift        # All supported view types
    DSL/                  # Swift DSL (result builders, fluent modifiers)
      Views/              # Node constructors (TextNode, VStackNode, etc.)
      Modifiers/          # Modifier extensions (Node+Layout, Node+Style, etc.)
      Animation/          # Animation types and values
    Layout.swift          # Style resolution system
    OrderedMultiDictionary.swift  # Order-preserving attribute storage
  SwiftUIML/              # iOS rendering library (requires SwiftUI)
    NodeView.swift        # Main rendering entry point
    RenderContext.swift   # Registry of view and modifier renderers
    ViewRendering/        # One file per view type renderer
    ModifierRendering/    # One file per modifier renderer
    Views/                # Reusable SwiftUI view components
    MessageQueue.swift    # Bidirectional messaging (host <-> component)
Tests/
  SwiftUIMLCoreTests/     # Unit tests for data model and DSL
  SwiftUIMLTests/         # Snapshot tests for renderers (Swift + TypeScript cross-validation)
TypeScript/               # TypeScript DSL package (mirrors Swift DSL)
Example/                  # Demo app (iOS) + Node.js server
Docs/                     # Design.md, Testing.md, Messages.md, Environment.md
```

## Key Patterns

**Adding a new view type:** Use `/add-view`. Requires: ViewType enum case, AttributeKey entries, ViewRenderer, DSL node constructor, snapshot test, TypeScript equivalent.

**Adding a new modifier:** Use `/add-modifier`. Requires: AttributeKey entry, ModifierRenderer, DSL extension method, snapshot test, TypeScript equivalent.

**Node architecture:** Nodes are immutable value types. All DSL methods return new `Node` instances. Attributes are stored as `OrderedMultiDictionary` (preserves order, supports duplicate keys, O(1) lookup).

**Renderer pattern:** `ViewRenderer` creates base SwiftUI views from nodes. `ModifierRenderer` applies individual modifiers. Both are registered in `RenderContext` and looked up by type/key at render time.

**Dual-language validation:** Swift and TypeScript DSLs must produce identical JSON. Snapshot tests run in both languages and compare visual output.

## Build & Test

```bash
make test          # Full suite: Core + Snapshots + TypeScript cross-validation
make coretest      # SwiftUIMLCore unit tests only
make snapshottest  # Swift snapshot tests only
make tstest        # TypeScript unit tests only
make lint          # SwiftLint + TypeScript format check
make format        # Auto-fix formatting (Swift + TypeScript)
```

Prerequisites: iOS 18.4 simulator (auto-created by `Scripts/sim.sh`), [xcbeautify](https://github.com/cpisciotta/xcbeautify), [swiftlint](https://github.com/realm/SwiftLint)

## Documentation

- [Design](Docs/Design.md) - Architecture and design decisions
- [Testing](Docs/Testing.md) - Multi-language test infrastructure and validation
- [Messages](Docs/Messages.md) - Messaging patterns and how they fit in
- [Environment](Docs/Environment.md) - Custom renderers via SwiftUI environment
- [TypeScript DSL](TypeScript/README.md) - TypeScript package usage and API

## Code Style

- 2-space indentation
- 120 character line length (warning), 150 (error)
- Trailing commas in multi-line collections
- No force unwraps - use safe optional handling
- No `print()` in production code (`#Preview` blocks are exempt)
