# Testing

**Guide to SwiftUIML's multi-language test infrastructure.**

## Overview

SwiftUIML provides DSLs in both Swift and TypeScript. Whether the JSON is produced on a server, in an embedded runtime, or anywhere else, both DSLs need to produce identical output for the same intent. If they diverge, bugs appear silently at runtime. The test infrastructure exists to catch these mismatches early — ensuring that both DSLs produce identical structures and that those structures render correctly.

The test suite covers four areas:

1. **Multi-Language Validation**: Different DSLs must produce identical JSON
2. **Visual Consistency**: Snapshot testing across light/dark modes
3. **Structural Integrity**: Core data model and DSL correctness
4. **Automated Cross-Validation**: TypeScript generates JSON that Swift validates

## Test Suites

### 1. Core Tests (`make coretest`)

**Target:** `SwiftUIMLCore` (platform-agnostic)
**Location:** `Tests/SwiftUIMLCoreTests/`

Tests data model, DSL, and serialization:
- JSON encoding/decoding, OrderedMultiDictionary preservation
- Stable ID generation, node manipulation
- All DSL methods (modifiers, views, enumerations)
- Special values (infinity, NaN), message wrapping

### 2. Snapshot Tests (`make snapshottest`)

**Target:** `SwiftUIML` (requires iOS 18.4 simulator)
**Location:** `Tests/SwiftUIMLTests/`

Visual regression tests:
- All view types (Text, Button, VStack, etc.)
- All modifiers (padding, colors, transforms, etc.)
- Standardized suite (cross-language validation)

Verifies pixel-perfect rendering across light/dark modes.

### 3. TypeScript Tests (`make tstest`)

**Location:** `TypeScript/tests/`

Tests TypeScript DSL:
- Builder functions produce correct structures
- JSON output compatible with Swift decoder
- Standardized suite test case generation

## The Standardized Suite

The standardized suite is the core mechanism for ensuring DSL parity. Each test case is defined in both Swift and TypeScript with a shared ID. When tests run, the system verifies that both DSLs produce the same JSON structure and that both render identically.

### Test Case IDs

Hierarchical namespacing:

```swift
TestCase.view.text.basic = "view.text.basic"
TestCase.modifier.padding.uniform = "modifier.padding.uniform"
```

Used for:
- File naming: `view.text.basic.json`
- Test matching: Swift loads external JSON by ID
- Organization: `category.feature.variant`

### Example

**TypeScript** (`TypeScript/tests/standardized-suite/views/text.ts`):
```typescript
export function generateTextTests(): Record<string, Node> {
  return {
    "view.text.basic": Text("hello"),
  };
}
```

**Swift** (`Tests/SwiftUIMLTests/Views/TextTests.swift`):
```swift
func testTextBasic() {
  testNode(TestCase.view.text.basic, size: CGSize(width: 50, height: 20)) {
    TextNode("hello")
  }
}
```

### Validation Flow: Two Passes

**Pass 1: Swift DSL Validation** (`make snapshottest`)
1. Build Swift node from DSL
2. Render snapshot
3. Compare pixels (or create if new)

Validates Swift DSL and rendering system.

**Pass 2: TypeScript Cross-Validation** (`make tssnapshottest`)
1. Generate JSON from TypeScript DSL
2. Build Swift node from DSL
3. Load TypeScript JSON
4. Compare structures (fail if different, but continue)
5. Render TypeScript node
6. Compare pixels against Pass 1 snapshots

Validates TypeScript produces identical JSON and renders identically.

## Snapshot Strategies

### ImageRenderer (Default)

Fast, deterministic rendering for pure SwiftUI views:

```swift
let renderer = ImageRenderer(content: view)
renderer.scale = 3.0
let image = renderer.uiImage
```

Works for: Text, VStack, Shapes, Colors, Images

### UIHostingController (Fallback)

Required for UIKit-backed controls:

```swift
let hostingController = UIHostingController(rootView: view)
// ... setup window hierarchy, wait for layout
```

Use for: TextField, DatePicker, Slider, ColorPicker, WebView

Set `useHostingController: true` in `testNode()`.

### Dual Mode Testing

Every snapshot generates light and dark mode images automatically.

## Adding a Test Case

1. **TypeScript**: Add to generator function
2. **Swift**: Add ID constant to `TestCase.swift`
3. **Swift**: Create test using `testNode()`
4. **Generate**: Run `make tssnapshottest`

If structures don't match, use `make tstest-single TEST=<testname>` for detailed diff.

## Running Tests

```bash
make test           # Full suite
make coretest       # SwiftUIMLCore only
make snapshottest   # Swift DSL snapshots
make tssnapshottest # TypeScript cross-validation
make tstest         # TypeScript unit tests
```

**Prerequisites:** iOS 18.4 simulator (auto-created), [xcbeautify](https://github.com/cpisciotta/xcbeautify)

## Troubleshooting

### Missing External Test Case Files

```bash
make tsgeneratesnapshots  # Generate TypeScript JSON
ls Tests/SwiftUIMLTests/ExternalTestCases/TypeScript/
```

### Structure Mismatch

**Symptom:** Test fails with JSON diff

**Common Causes:**
- Different attribute keys or order
- Value type differences (string vs number)
- Missing or extra attributes

**Solution:**
```bash
make tstest-single TEST=<TestName>  # Verbose diff
cat Tests/SwiftUIMLTests/ExternalTestCases/TypeScript/<testid>.json  # Inspect
# Fix TypeScript DSL, regenerate, re-test
```

### Missing Snapshot Images

First run generates reference snapshots automatically. If deleted:

```bash
make snapshottest  # Regenerates missing snapshots
ls Tests/SwiftUIMLTests/_Snapshots/<TestClass>/<testid>/
```

## Best Practices

- Always add test cases to both Swift and TypeScript
- Test both light and dark modes (default behavior)
- Use hierarchical IDs: `category.feature.variant`
- Choose appropriate sizes (small for speed, large enough to see content)
- Review snapshot diffs carefully before updating
