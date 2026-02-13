# Add Standardized Test

Create a cross-language snapshot test with matching Swift and TypeScript implementations.

## Overview

Each standardized test is defined in both Swift and TypeScript to ensure the DSLs produce identical JSON. Tests use `testNode()` which renders via ImageRenderer and compares snapshots.

## Steps

### 1. Add test ID constant

**Swift** (`Tests/SwiftUIMLTests/TestCase.swift`):
```swift
struct TestCase {
  struct modifier {
    struct myModifier {
      static let basic = "modifier.my-modifier.basic"
    }
  }
}
```

### 2. Create Swift test

**File:** `Tests/SwiftUIMLTests/Views/[Name]Tests.swift` or `Tests/SwiftUIMLTests/Modifiers/[Name]Tests.swift`

```swift
import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class [Name]Tests: XCTestCase {
  @MainActor
  func testBasic() {
    testNode(TestCase.modifier.myModifier.basic, size: CGSize(width: 100, height: 100)) {
      TextNode("Hello")
        .myModifier("value")
    }
  }
}
```

### 3. Create TypeScript test

**File:** `TypeScript/tests/standardized-suite/views/[name].ts` or `TypeScript/tests/standardized-suite/modifiers/[name].ts`

```typescript
import { Node, Text } from "../../../src/index";

export function generateMyModifierTests(): Record<string, Node> {
  return {
    "modifier.my-modifier.basic": Text("Hello")
      .myModifier("value"),
  };
}
```

### 4. Register in `TypeScript/tests/standardized-suite/generate.ts`

### 5. Generate and test

```bash
make tsgeneratetestcases   # Generate JSON from TypeScript
make test                  # Run all tests including cross-validation
```

## Key rules

- Test IDs use dot-separated kebab-case: `modifier.padding.uniform`, `view.text.basic`
- Swift and TypeScript must produce identical JSON — same modifiers, same order
- Mark Swift tests with `@MainActor`
- Use existing tests as reference: `Tests/SwiftUIMLTests/Modifiers/BlurTests.swift` and `TypeScript/tests/standardized-suite/modifiers/blur.ts`
