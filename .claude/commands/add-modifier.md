# Add New Modifier

Add a new modifier to SwiftUIML following the project's architecture patterns.

## Steps

1. Ask the user what modifier they want to add and what SwiftUI modifier it should apply
2. Define the AttributeKey constant in `Sources/SwiftUIMLCore/AttributeKey.swift`
3. Create the ModifierRenderer in `Sources/SwiftUIML/ModifierRendering/[Name]ModifierRenderer.swift`
4. Register the renderer in `Sources/SwiftUIML/RenderContext+Default.swift`
5. Add optional DSL extension in `Sources/SwiftUIMLCore/DSL/Modifiers.swift`
6. Add TypeScript modifier method in `TypeScript/src/node-modifiers.ts` and attribute key in `TypeScript/src/attribute-key.ts`
7. Create Swift tests in `Tests/SwiftUIMLTests/ModifierRendering/[Name]ModifierRendererTests.swift`
8. Add TypeScript unit tests in `TypeScript/tests/modifiers.test.ts` (uses `node:test` — see existing tests for pattern)
9. Add cross-language standardized test in `TypeScript/tests/standardized-suite/modifiers/[name].ts` with matching Swift test
10. Run `make test` and `make lint` (`make tstest` to run TypeScript tests alone)

## Notes

- Use existing modifier renderers as templates — PaddingModifierRenderer and ForegroundColorModifierRenderer are good examples
- Include a `#Preview` block that wraps the node in `DebugView` (see any existing renderer for the pattern)
