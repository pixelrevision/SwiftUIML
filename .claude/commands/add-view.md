# Add New View Type

Add a new view type to SwiftUIML following the project's architecture patterns.

## Steps

1. Ask the user what view type they want to add and what SwiftUI view it should wrap
2. Define the ViewType constant in `Sources/SwiftUIMLCore/ViewType.swift`
3. Create the ViewRenderer in `Sources/SwiftUIML/ViewRendering/[Name]Renderer.swift`
4. Register the renderer in `Sources/SwiftUIML/RenderContext+Default.swift`
5. Create optional DSL helper in `Sources/SwiftUIMLCore/DSL/Views/[Name]Node.swift`
6. Add any new AttributeKey constants needed in `Sources/SwiftUIMLCore/AttributeKey.swift`
7. Add TypeScript view function in `TypeScript/src/views.ts` and type constant in `TypeScript/src/view-type.ts`
8. Create Swift tests in `Tests/SwiftUIMLTests/ViewRendering/[Name]RendererTests.swift`
9. Add TypeScript unit tests in `TypeScript/tests/views.test.ts` (uses `node:test` — see existing tests for pattern)
10. Add cross-language standardized test in `TypeScript/tests/standardized-suite/views/[name].ts` with matching Swift test
11. Run `make test` and `make lint` (`make tstest` to run TypeScript tests alone)

## Notes

- Use existing renderers as templates — TextRenderer and ButtonRenderer are good simple examples
- Include a `#Preview` block that wraps the node in `DebugView` (see any existing renderer for the pattern)
