import XCTest
@testable import SwiftUIMLCore

final class NodeBlendModeTests: XCTestCase {
  func testBlendModeMultiply() {
    let node = TextNode("Test").blendMode(.multiply)

    let blendMode = node.attributes[.blendMode]?.string
    XCTAssertEqual(blendMode, "multiply")
  }

  func testBlendModeScreen() {
    let node = TextNode("Test").blendMode(.screen)

    let blendMode = node.attributes[.blendMode]?.string
    XCTAssertEqual(blendMode, "screen")
  }

  func testBlendModeOverlay() {
    let node = TextNode("Test").blendMode(.overlay)

    let blendMode = node.attributes[.blendMode]?.string
    XCTAssertEqual(blendMode, "overlay")
  }

  func testBlendModeNormal() {
    let node = TextNode("Test").blendMode(.normal)

    let blendMode = node.attributes[.blendMode]?.string
    XCTAssertEqual(blendMode, "normal")
  }

  func testBlendModeCanBeChained() {
    let node = TextNode("Test")
      .blendMode(.multiply)
      .opacity(0.5)

    let blendMode = node.attributes[.blendMode]?.string
    XCTAssertEqual(blendMode, "multiply")

    let opacity = node.attributes[.opacity]?.cgFloat
    XCTAssertEqual(opacity, 0.5)
  }
}
