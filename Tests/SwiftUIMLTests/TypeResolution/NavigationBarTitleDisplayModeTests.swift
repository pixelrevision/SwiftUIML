import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class NavigationBarTitleDisplayModeTests: XCTestCase {
  func testNavigationBarTitleDisplayModeAutomatic() {
    let result = NavigationBarItem.TitleDisplayMode(AttributeValue("automatic"))
    XCTAssertEqual(result, NavigationBarItem.TitleDisplayMode.automatic)
  }

  func testNavigationBarTitleDisplayModeInline() {
    let result = NavigationBarItem.TitleDisplayMode(AttributeValue("inline"))
    XCTAssertEqual(result, NavigationBarItem.TitleDisplayMode.inline)
  }

  func testNavigationBarTitleDisplayModeLarge() {
    let result = NavigationBarItem.TitleDisplayMode(AttributeValue("large"))
    XCTAssertEqual(result, NavigationBarItem.TitleDisplayMode.large)
  }

  func testNavigationBarTitleDisplayModeInvalid() {
    let result = NavigationBarItem.TitleDisplayMode(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
