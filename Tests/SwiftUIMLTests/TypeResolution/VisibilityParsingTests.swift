import XCTest
import SwiftUI
@testable import SwiftUIML

final class VisibilityParsingTests: XCTestCase {
  func testVisibilityAutomatic() {
    let visibility = Visibility("automatic")
    XCTAssertEqual(visibility, .automatic)
  }

  func testVisibilityVisible() {
    let visibility = Visibility("visible")
    XCTAssertEqual(visibility, .visible)
  }

  func testVisibilityHidden() {
    let visibility = Visibility("hidden")
    XCTAssertEqual(visibility, .hidden)
  }

  func testVisibilityInvalid() {
    let visibility = Visibility("invalid")
    XCTAssertNil(visibility)
  }

  func testVisibilityEmpty() {
    let visibility = Visibility("")
    XCTAssertNil(visibility)
  }
}
