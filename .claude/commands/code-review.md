# Code Review

Perform a comprehensive code review of staged changes or current branch against main.

## Scope

Automatically detect whether to review:
- Staged changes (if any exist)
- Current branch vs main (if no staged changes)

## Review Checklist

### Code Quality
- Run `make lint`
- Check for force unwrapping, indentation (2 spaces), line length (120/150), trailing commas

### Testing
- Run `make test`
- New ViewRenderers have tests in `Tests/SwiftUIMLTests/Views/`
- New ModifierRenderers have tests in `Tests/SwiftUIMLTests/Modifiers/`
- TypeScript parity: matching test in `TypeScript/tests/standardized-suite/`

### Architecture
- New ViewTypes registered in `Sources/SwiftUIML/RenderContext+Default.swift`
- New AttributeKeys defined in `Sources/SwiftUIMLCore/AttributeKey.swift`
- Renderers follow standard pattern (see CLAUDE.md)
- DSL helpers created where appropriate
- TypeScript DSL updated (`TypeScript/src/views.ts` or `TypeScript/src/node-modifiers.ts`)

### Serialization
- New nodes are JSON serializable/deserializable
- Test DSL → JSON → DSL round-trip
- OrderedMultiDictionary used for attributes
- Nested nodes use `$type: "node"` discriminator

### General
- No sensitive data, debug prints, or unresolved TODOs
- Public APIs documented
- Attribute order preserved (critical for modifiers)
- Backward compatible JSON serialization

## Output

Provide a summary: files changed, test/lint results, architecture compliance, action items, and recommendations.
