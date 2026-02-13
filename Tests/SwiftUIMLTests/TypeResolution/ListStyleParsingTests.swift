import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class ListStyleParsingTests: XCTestCase {
  func testListStyleAutomatic() {
    let result = ListStyle(AttributeValue("automatic"))
    XCTAssertNotNil(result)
  }

  func testListStylePlain() {
    let result = ListStyle(AttributeValue("plain"))
    XCTAssertNotNil(result)
  }

  func testListStyleGrouped() {
    let result = ListStyle(AttributeValue("grouped"))
    XCTAssertNotNil(result)
  }

  func testListStyleInset() {
    let result = ListStyle(AttributeValue("inset"))
    XCTAssertNotNil(result)
  }

  func testListStyleInsetGrouped() {
    let result = ListStyle(AttributeValue("insetGrouped"))
    XCTAssertNotNil(result)
  }

  func testListStyleSidebar() {
    let result = ListStyle(AttributeValue("sidebar"))
    XCTAssertNotNil(result)
  }

  func testListStyleInvalid() {
    let result = ListStyle(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
