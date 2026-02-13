import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class ColorSchemeParsingTests: XCTestCase {
  func testColorSchemeLight() {
    let result = ColorScheme(AttributeValue("light"))
    XCTAssertEqual(result, .light)
  }

  func testColorSchemeDark() {
    let result = ColorScheme(AttributeValue("dark"))
    XCTAssertEqual(result, .dark)
  }

  func testColorSchemeInvalid() {
    let result = ColorScheme(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
