import XCTest
@testable import SwiftUIMLCore

final class NodePresentationTests: XCTestCase {
  func testPresentationDetentsWithArray() {
    let node = TextNode("Test").presentationDetents([.medium, .large])

    let detents = node.attributes[.presentationDetents]?.array
    XCTAssertNotNil(detents)
    XCTAssertEqual(detents?.count, 2)
    XCTAssertEqual(detents?[0].string, "medium")
    XCTAssertEqual(detents?[1].string, "large")
  }

  func testPresentationDetentsWithMixedArray() {
    let node = TextNode("Test").presentationDetents([.medium, .fraction(0.5), .height(300)])

    let detents = node.attributes[.presentationDetents]?.array
    XCTAssertNotNil(detents)
    XCTAssertEqual(detents?.count, 3)
    XCTAssertEqual(detents?[0].string, "medium")

    let fractionDict = detents?[1].dict
    XCTAssertNotNil(fractionDict)
    XCTAssertEqual(fractionDict?[.type]?.string, "fraction")
    XCTAssertEqual(fractionDict?[.value]?.cgFloat, 0.5)

    let heightDict = detents?[2].dict
    XCTAssertNotNil(heightDict)
    XCTAssertEqual(heightDict?[.type]?.string, "height")
    XCTAssertEqual(heightDict?[.value]?.cgFloat, 300)
  }

  func testPresentationDetentsWithSingle() {
    let node = TextNode("Test").presentationDetents(.large)

    let detents = node.attributes[.presentationDetents]?.array
    XCTAssertNotNil(detents)
    XCTAssertEqual(detents?.count, 1)
    XCTAssertEqual(detents?[0].string, "large")
  }

  func testPresentationDragIndicatorVisible() {
    let node = TextNode("Test").presentationDragIndicator(.visible)

    let visibility = node.attributes[.presentationDragIndicator]?.string
    XCTAssertEqual(visibility, "visible")
  }

  func testPresentationDragIndicatorHidden() {
    let node = TextNode("Test").presentationDragIndicator(.hidden)

    let visibility = node.attributes[.presentationDragIndicator]?.string
    XCTAssertEqual(visibility, "hidden")
  }

  func testPresentationDragIndicatorAutomatic() {
    let node = TextNode("Test").presentationDragIndicator(.automatic)

    let visibility = node.attributes[.presentationDragIndicator]?.string
    XCTAssertEqual(visibility, "automatic")
  }

  func testInteractiveDismissDisabledDefault() {
    let node = TextNode("Test").interactiveDismissDisabled()

    let disabled = node.attributes[.interactiveDismissDisabled]?.bool
    XCTAssertEqual(disabled, true)
  }

  func testInteractiveDismissDisabledTrue() {
    let node = TextNode("Test").interactiveDismissDisabled(true)

    let disabled = node.attributes[.interactiveDismissDisabled]?.bool
    XCTAssertEqual(disabled, true)
  }

  func testInteractiveDismissDisabledFalse() {
    let node = TextNode("Test").interactiveDismissDisabled(false)

    let disabled = node.attributes[.interactiveDismissDisabled]?.bool
    XCTAssertEqual(disabled, false)
  }

  func testCombinedPresentationModifiers() {
    let node = TextNode("Test")
      .presentationDetents([.medium, .large])
      .presentationDragIndicator(.visible)
      .interactiveDismissDisabled(true)

    let detents = node.attributes[.presentationDetents]?.array
    XCTAssertNotNil(detents)
    XCTAssertEqual(detents?.count, 2)

    let visibility = node.attributes[.presentationDragIndicator]?.string
    XCTAssertEqual(visibility, "visible")

    let disabled = node.attributes[.interactiveDismissDisabled]?.bool
    XCTAssertEqual(disabled, true)
  }
}
