import XCTest
@testable import SwiftUIMLCore

final class NodeListModifiersTests: XCTestCase {
  func testListRowBackground() {
    let background = ColorNode("#FF0000")
    let node = TextNode("Test").listRowBackground(background)

    let bgNode = node.attributes[.listRowBackground]?.node
    XCTAssertNotNil(bgNode)
    XCTAssertEqual(bgNode?.type, .color)
    XCTAssertEqual(node.attributes[.ignoreEquatable]?.bool, true)
  }

  func testListRowBackgroundWithBuilder() {
    let node = TextNode("Test").listRowBackground {
      ColorNode("#FF0000")
    }

    let bgNode = node.attributes[.listRowBackground]?.node
    XCTAssertNotNil(bgNode)
    XCTAssertEqual(bgNode?.type, .color)
    XCTAssertEqual(node.attributes[.ignoreEquatable]?.bool, true)
  }

  func testListRowInsets() {
    let node = TextNode("Test").listRowInsets(top: 10, leading: 20, bottom: 30, trailing: 40)

    let insets = node.attributes[.listRowInsets]?.dict
    XCTAssertNotNil(insets)
    XCTAssertEqual(insets?[.top]?.cgFloat, 10)
    XCTAssertEqual(insets?[.leading]?.cgFloat, 20)
    XCTAssertEqual(insets?[.bottom]?.cgFloat, 30)
    XCTAssertEqual(insets?[.trailing]?.cgFloat, 40)
    XCTAssertEqual(node.attributes[.ignoreEquatable]?.bool, true)
  }

  func testListRowInsetsDefaults() {
    let node = TextNode("Test").listRowInsets()

    let insets = node.attributes[.listRowInsets]?.dict
    XCTAssertNotNil(insets)
    XCTAssertEqual(insets?[.top]?.cgFloat, 0)
    XCTAssertEqual(insets?[.leading]?.cgFloat, 0)
    XCTAssertEqual(insets?[.bottom]?.cgFloat, 0)
    XCTAssertEqual(insets?[.trailing]?.cgFloat, 0)
    XCTAssertEqual(node.attributes[.ignoreEquatable]?.bool, true)
  }

  func testListRowSeparatorSimple() {
    let node = TextNode("Test").listRowSeparator(visibility: .hidden)

    let separator = node.attributes[.listRowSeparator]?.string
    XCTAssertEqual(separator, "hidden")
    XCTAssertEqual(node.attributes[.ignoreEquatable]?.bool, true)
  }

  func testListRowSeparatorWithEdges() {
    let node = TextNode("Test").listRowSeparator(visibility: .hidden, edges: .top)

    let separator = node.attributes[.listRowSeparator]?.dict
    XCTAssertNotNil(separator)
    XCTAssertEqual(separator?[.visibility]?.string, "hidden")
    XCTAssertEqual(separator?[.edges]?.string, "top")
    XCTAssertEqual(node.attributes[.ignoreEquatable]?.bool, true)
  }
}
