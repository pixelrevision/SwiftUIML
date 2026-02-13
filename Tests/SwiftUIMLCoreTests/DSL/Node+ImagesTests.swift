import XCTest
@testable import SwiftUIMLCore

final class NodeImagesTests: XCTestCase {
  func testResizable() {
    let node = ImageNode(systemName: "star").resizable()
    XCTAssertEqual(node.attributes[.resizable]?.bool, true)
  }

  func testRenderingMode() {
    let node = ImageNode(systemName: "star").renderingMode(.template)
    XCTAssertEqual(node.attributes[.renderingMode]?.string, "template")
  }

  func testRenderingModeOriginal() {
    let node = ImageNode(systemName: "star").renderingMode(.original)
    XCTAssertEqual(node.attributes[.renderingMode]?.string, "original")
  }
  
  func testAspectRatioNumber() {
    let node = ImageNode(systemName: "star").aspectRatio(1.5)

    let dict = node.attributes[.aspectRatio]?.dict
    XCTAssertEqual(dict?[.ratio]?.float, 1.5)
    XCTAssertEqual(dict?[.contentMode]?.string, "fit")
  }

  func testAspectRatioNumberWithFill() {
    let node = ImageNode(systemName: "star").aspectRatio(1.5, contentMode: .fill)

    let dict = node.attributes[.aspectRatio]?.dict
    XCTAssertEqual(dict?[.ratio]?.float, 1.5)
    XCTAssertEqual(dict?[.contentMode]?.string, "fill")
  }

  func testAspectRatioString() {
    let node = ImageNode(systemName: "star").aspectRatio("16:9")

    let dict = node.attributes[.aspectRatio]?.dict
    XCTAssertEqual(dict?[.ratio]?.string, "16:9")
    XCTAssertEqual(dict?[.contentMode]?.string, "fit")
  }

  func testAspectRatioStringWithFill() {
    let node = ImageNode(systemName: "star").aspectRatio("4:3", contentMode: .fill)

    let dict = node.attributes[.aspectRatio]?.dict
    XCTAssertEqual(dict?[.ratio]?.string, "4:3")
    XCTAssertEqual(dict?[.contentMode]?.string, "fill")
  }
}
