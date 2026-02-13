import XCTest
@testable import SwiftUIMLCore

final class NodeColorsTests: XCTestCase {
  func testForegroundColor() {
    let node = TextNode("Test").foregroundColor("#FF0000")
    XCTAssertEqual(node.attributes[.foregroundColor]?.string, "#FF0000")
  }

  func testForegroundColorNamed() {
    let node = TextNode("Test").foregroundColor("red")
    XCTAssertEqual(node.attributes[.foregroundColor]?.string, "red")
  }

  func testBackgroundColor() {
    let node = TextNode("Test").backgroundColor("#0000FF")
    XCTAssertEqual(node.attributes[.backgroundColor]?.string, "#0000FF")
  }

  func testBackgroundColorNamed() {
    let node = TextNode("Test").backgroundColor("blue")
    XCTAssertEqual(node.attributes[.backgroundColor]?.string, "blue")
  }

  func testTint() {
    let node = TextNode("Test").tint("#00FF00")
    XCTAssertEqual(node.attributes[.tint]?.string, "#00FF00")
  }

  func testColorScheme() {
    let node = TextNode("Test").colorScheme(.dark)
    XCTAssertEqual(node.attributes[.colorScheme]?.string, "dark")
  }

  func testPreferredColorScheme() {
    let node = TextNode("Test").preferredColorScheme(.dark)
    XCTAssertEqual(node.attributes[.preferredColorScheme]?.string, "dark")
  }

  func testColorSchemeConditional() {
    let node = TextNode("Test").colorSchemeConditional([
      .light: [.foregroundColor: .string("#000000")],
      .dark: [.foregroundColor: .string("#FFFFFF")],
    ])

    let dict = node.attributes[.colorSchemeConditional]?.dict
    XCTAssertNotNil(dict)

    // Check light scheme
    let lightArray = dict?[.init("light")]?.array
    XCTAssertNotNil(lightArray)
    XCTAssertEqual(lightArray?.count, 2) // Key-value pairs flattened

    // Check dark scheme
    let darkArray = dict?[.init("dark")]?.array
    XCTAssertNotNil(darkArray)
    XCTAssertEqual(darkArray?.count, 2)
  }

  func testColorSchemeConditionalLightOnly() {
    let node = TextNode("Test").colorSchemeConditional([
      .light: [.backgroundColor: .string("#FFFFFF")],
    ])

    let dict = node.attributes[.colorSchemeConditional]?.dict
    XCTAssertNotNil(dict?[.init("light")])
    XCTAssertNil(dict?[.init("dark")])
  }

  func testColorSchemeConditionalDarkOnly() {
    let node = TextNode("Test").colorSchemeConditional([
      .dark: [.backgroundColor: .string("#000000")],
    ])

    let dict = node.attributes[.colorSchemeConditional]?.dict
    XCTAssertNotNil(dict?[.init("dark")])
    XCTAssertNil(dict?[.init("light")])
  }
}
