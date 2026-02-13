# Add Snapshot Test

Create a snapshot test for a ViewRenderer or ModifierRenderer.

## Steps

1. Ask the user which renderer to test
2. Create test file:
   - ViewRenderer: `Tests/SwiftUIMLTests/Views/[Name]Tests.swift`
   - ModifierRenderer: `Tests/SwiftUIMLTests/Modifiers/[Name]Tests.swift`

3. Follow this pattern:
   ```swift
   import XCTest
   @testable import SwiftUIML
   @testable import SwiftUIMLCore

   class [Name]Tests: XCTestCase {
     @MainActor
     func test[DescriptiveCase]() {
       testNode(TestCase.[category].[name].[case], size: CGSize(width: X, height: Y)) {
         [ViewType]Node([params])
           .[modifier]([value])
       }
     }
   }
   ```

4. Add test ID constant in `Tests/SwiftUIMLTests/TestCase.swift`
5. Add matching TypeScript test in `TypeScript/tests/standardized-suite/`
6. Keep sizes small: text `50x20`, buttons `100x40`, containers `150x100`
7. Test ONE thing per function, use minimal content
8. Run `make test` to generate snapshots, inspect `_Snapshots/`, run again to verify
9. Commit test file and snapshot images

## Non-visual modifiers (no snapshot needed)

- Behavioral modifiers (scroll, gestures, onAppear/onDisappear)
- Accessibility modifiers (metadata only)

## Notes

- `testNode()` uses ImageRenderer and captures both light and dark mode automatically
- Mark all test methods with `@MainActor`
- Saved to `Tests/SwiftUIMLTests/_Snapshots/[TestClass]/`
