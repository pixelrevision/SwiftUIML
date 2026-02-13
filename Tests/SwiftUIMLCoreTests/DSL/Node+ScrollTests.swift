import XCTest
@testable import SwiftUIMLCore

final class NodeScrollTests: XCTestCase {
  func testScrollBounceBehavior() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollBounceBehavior(.always)

    let dict = node.attributes[.scrollBounceBehavior]?.dict
    XCTAssertEqual(dict?[.behavior]?.string, "always")
    XCTAssertEqual(dict?[.axis]?.string, "vertical")
  }

  func testScrollBounceBehaviorHorizontal() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollBounceBehavior(.basedOnSize, axes: .horizontal)

    let dict = node.attributes[.scrollBounceBehavior]?.dict
    XCTAssertEqual(dict?[.behavior]?.string, "basedOnSize")
    XCTAssertEqual(dict?[.axis]?.string, "horizontal")
  }

  func testScrollBounceBehaviorNever() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollBounceBehavior(.never)

    let dict = node.attributes[.scrollBounceBehavior]?.dict
    XCTAssertEqual(dict?[.behavior]?.string, "never")
  }

  func testScrollTargetBehaviorPaging() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollTargetBehavior(.paging)

    XCTAssertEqual(node.attributes[.scrollTargetBehavior]?.string, "paging")
  }

  func testScrollTargetBehaviorViewAligned() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollTargetBehavior(.viewAligned)

    XCTAssertEqual(node.attributes[.scrollTargetBehavior]?.string, "viewAligned")
  }

  func testScrollTargetLayout() {
    let node = LazyVStackNode {
      TextNode("Test")
    }.scrollTargetLayout()

    XCTAssertEqual(node.attributes[.scrollTargetLayout]?.bool, true)
  }

  func testScrollDisabled() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollDisabled()

    XCTAssertEqual(node.attributes[.scrollDisabled]?.bool, true)
  }

  func testScrollDisabledExplicit() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollDisabled(false)

    XCTAssertEqual(node.attributes[.scrollDisabled]?.bool, false)
  }

  func testScrollIndicators() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollIndicators(.hidden)

    XCTAssertEqual(node.attributes[.scrollIndicators]?.string, "hidden")
  }

  func testScrollIndicatorsWithAxes() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollIndicators(.visible, axes: .horizontal)

    let dict = node.attributes[.scrollIndicators]?.dict
    XCTAssertEqual(dict?[.type]?.string, "visible")
    XCTAssertEqual(dict?[.axis]?.string, "horizontal")
  }

  func testScrollIndicatorsNever() {
    let node = ScrollViewNode {
      TextNode("Test")
    }.scrollIndicators(.never)

    XCTAssertEqual(node.attributes[.scrollIndicators]?.string, "never")
  }
}
