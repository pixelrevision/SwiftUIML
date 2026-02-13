# Documentation Audit

Comprehensive audit of all SwiftUIML documentation for accuracy, consistency, and completeness.

## Files to Review

- `README.md` — Project overview
- `TypeScript/README.md` — TypeScript DSL documentation
- `Docs/Design.md` — Architecture and design decisions
- `Docs/Testing.md` — Test infrastructure and patterns
- `Docs/Messages.md` — Bidirectional messaging guide
- `Docs/Environment.md` — Environment configuration guide
- `CLAUDE.md` — Development guide

## What to Verify

### API Accuracy
- View/modifier counts and lists match `Sources/SwiftUIML/RenderContext+Default.swift`
- TypeScript README matches `TypeScript/src/views.ts` and `TypeScript/src/node-modifiers.ts`
- Count by actually counting, don't trust doc claims

### Code Examples
- Swift examples use correct DSL syntax and would compile
- TypeScript examples use correct DSL syntax and imports
- JSON examples match actual serialization format (2D array attributes, `$type: "node"` discriminator)

### Architecture
- Design.md reflects actual implementation (Node, OrderedMultiDictionary, RenderContext)
- Non-goals are still accurate
- Testing.md matches Makefile commands and actual test structure

### Cross-References
- All internal links valid
- Section anchors work
- Referenced files exist at stated paths

### Terminology
- "data-driven" not "server-driven" or "server-side"
- Source-agnostic language (no prescriptive server-side framing)
- Consistent capitalization: Node (type) vs node (instance), ViewRenderer, AttributeKey

## Output

Report findings as a message: executive summary, issues by category (API accuracy, code examples, architecture, links, terminology), and prioritized recommendations.

## Guidelines

- Read actual source files — don't assume docs are correct
- Check every code example
- Flag contradictions between docs
- Verify version requirements (iOS 18.4, simulator, etc.)
