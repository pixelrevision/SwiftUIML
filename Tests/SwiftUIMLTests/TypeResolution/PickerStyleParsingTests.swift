import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class PickerStyleParsingTests: XCTestCase {
  func testPickerStyleAutomatic() {
    let result = PickerStyle(AttributeValue("automatic"))
    XCTAssertNotNil(result)
  }

  func testPickerStyleInline() {
    let result = PickerStyle(AttributeValue("inline"))
    XCTAssertNotNil(result)
  }

  func testPickerStyleMenu() {
    let result = PickerStyle(AttributeValue("menu"))
    XCTAssertNotNil(result)
  }

  func testPickerStyleNavigationLink() {
    let result = PickerStyle(AttributeValue("navigationLink"))
    XCTAssertNotNil(result)
  }

  func testPickerStylePalette() {
    let result = PickerStyle(AttributeValue("palette"))
    XCTAssertNotNil(result)
  }

  func testPickerStyleSegmented() {
    let result = PickerStyle(AttributeValue("segmented"))
    XCTAssertNotNil(result)
  }

  func testPickerStyleWheel() {
    let result = PickerStyle(AttributeValue("wheel"))
    XCTAssertNotNil(result)
  }

  func testPickerStyleInvalid() {
    let result = PickerStyle(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
