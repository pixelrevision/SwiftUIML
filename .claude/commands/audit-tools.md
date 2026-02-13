# Tools Audit

Audit all `.claude/commands/` files for accuracy against the actual codebase.

## For each command, verify:

1. **File paths** — Every path referenced actually exists in the repo
2. **Test patterns** — Code templates match how tests are actually written (check recent test files)
3. **Test runners** — Commands reference the correct test runner (`testNode()` vs `runSnapshot()`, `node:test`, etc.)
4. **Make targets** — Referenced make targets exist in the Makefile
5. **TypeScript coverage** — Creation commands include TypeScript steps with correct file locations
6. **Exceptions/notes** — Any listed exceptions (non-visual modifiers, etc.) are still accurate

## How to verify

- Read actual test files in `Tests/SwiftUIMLTests/` and compare against command templates
- Read `TypeScript/tests/` to confirm TypeScript test patterns
- Cross-reference file paths with `Sources/SwiftUIMLCore/` and `Sources/SwiftUIML/`
- Check `Makefile` for referenced targets
- Look at a few recent renderers to confirm the preview/DebugView pattern

## Output

Report findings as a message listing each command and any issues found. Fix issues directly.
