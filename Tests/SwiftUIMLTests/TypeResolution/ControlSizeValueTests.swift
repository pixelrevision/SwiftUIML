import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class ControlSizeValueTests: XCTestCase {
  func testControlSizeMini() {
    let result = ControlSize(AttributeValue("mini"))
    XCTAssertEqual(result, .mini)
  }

  func testControlSizeSmall() {
    let result = ControlSize(AttributeValue("small"))
    XCTAssertEqual(result, .small)
  }

  func testControlSizeRegular() {
    let result = ControlSize(AttributeValue("regular"))
    XCTAssertEqual(result, .regular)
  }

  func testControlSizeLarge() {
    let result = ControlSize(AttributeValue("large"))
    XCTAssertEqual(result, .large)
  }

  func testControlSizeExtraLarge() {
    let result = ControlSize(AttributeValue("extraLarge"))
    XCTAssertEqual(result, .extraLarge)
  }

  func testControlSizeInvalid() {
    let result = ControlSize(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
