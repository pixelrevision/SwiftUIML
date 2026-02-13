import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class ToggleStyleParsingTests: XCTestCase {
  func testToggleStyleAutomatic() {
    let result = ToggleStyle(AttributeValue("automatic"))
    XCTAssertNotNil(result)
  }

  func testToggleStyleSwitch() {
    let result = ToggleStyle(AttributeValue("switch"))
    XCTAssertNotNil(result)
  }

  func testToggleStyleButton() {
    let result = ToggleStyle(AttributeValue("button"))
    XCTAssertNotNil(result)
  }

  func testToggleStyleInvalid() {
    let result = ToggleStyle(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
