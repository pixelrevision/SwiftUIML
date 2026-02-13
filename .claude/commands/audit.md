# Project Audit

Comprehensive audit of the SwiftUIML project. Be thorough — read actual code, don't just check if files exist.

## Scope

For every view type and modifier, verify:

1. **Swift API** — DSL in `Sources/SwiftUIMLCore/DSL/`, tests in `Tests/SwiftUIMLCoreTests/`, renderer in `Sources/SwiftUIML/ViewRendering/` or `ModifierRendering/`
2. **TypeScript API** — Views in `TypeScript/src/views.ts`, modifiers in `TypeScript/src/node-modifiers.ts`, types in `TypeScript/src/view-type.ts` and `TypeScript/src/attribute-key.ts`
3. **Parity** — Same view types, attribute keys, DSL signatures, and defaults in both languages
4. **Edge Cases** — Empty/nil values, invalid inputs handled gracefully, optional parameters work
5. **Snapshot Tests** — Cross-language tests in `Tests/SwiftUIMLTests/Views/` and `Modifiers/` with TypeScript counterparts in `TypeScript/tests/standardized-suite/`

## Process

Work through `Sources/SwiftUIMLCore/ViewType.swift` for all views, then `Sources/SwiftUIMLCore/DSL/Modifiers.swift` for all modifiers. Cross-reference against `Sources/SwiftUIML/RenderContext+Default.swift` for registered renderers.

## Architectural Exceptions (do NOT flag)

- **GridRow** — Rendered by parent GridRenderer (SwiftUI requires concrete GridRow types, not type-erased views)
- **ToolbarContent** — Metadata container, not renderable
- **ForEach** — DSL-only helper that expands at construction time, no ViewType/renderer needed

## Output

Create `AUDIT.md` with: executive summary, critical issues, missing tests, API inconsistencies, edge case gaps, detailed per-view/modifier review, and recommendations.

## Snapshot Test Expectations

Not all views and modifiers need snapshot tests. Behavioral-only components (e.g., NavigationStack, ScrollView, keyboard/input modifiers) whose effects are non-visual or require runtime interaction are fine without snapshot coverage. DSL unit tests and TypeResolution tests are sufficient for these. When reporting missing snapshot tests, note which are behavioral-only and treat them as informational, not action items.

## Guidelines

- Check every view and modifier
- Look for type mismatches between Swift and TypeScript
- Verify attribute types match across languages
- Flag TODOs, FIXMEs, and debug prints (`#Preview` blocks are exempt)
- Verify JSON round-trip works for new nodes
