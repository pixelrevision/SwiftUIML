import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class AccessibilityChildBehaviorTests: XCTestCase {
  func testAccessibilityChildBehaviorContain() {
    let result = AccessibilityChildBehavior(AttributeValue("contain"))
    XCTAssertEqual(result, .contain)
  }

  func testAccessibilityChildBehaviorIgnore() {
    let result = AccessibilityChildBehavior(AttributeValue("ignore"))
    XCTAssertEqual(result, .ignore)
  }

  func testAccessibilityChildBehaviorCombine() {
    let result = AccessibilityChildBehavior(AttributeValue("combine"))
    XCTAssertEqual(result, .combine)
  }

  func testAccessibilityChildBehaviorInvalid() {
    let result = AccessibilityChildBehavior(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
