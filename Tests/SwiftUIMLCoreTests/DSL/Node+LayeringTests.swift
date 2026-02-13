import XCTest
@testable import SwiftUIMLCore

final class NodeLayeringTests: XCTestCase {
  func testOverlay() {
    let overlayNode = ColorNode("#FF0000")
    let node = TextNode("Test").overlay(overlayNode)

    let overlay = node.attributes[.overlay]?.node
    XCTAssertEqual(overlay?.type, .color)
    XCTAssertEqual(overlay?.attributes[.value]?.string, "#FF0000")
  }

  func testOverlayWithAlignment() {
    let overlayNode = ColorNode("#FF0000")
    let node = TextNode("Test").overlay(overlayNode, alignment: .topLeading)

    let dict = node.attributes[.overlay]?.dict
    XCTAssertNotNil(dict?[.value]?.node)
    XCTAssertEqual(dict?[.alignment]?.string, "topLeading")
  }

  func testBackground() {
    let backgroundNode = ColorNode("#0000FF")
    let node = TextNode("Test").background(backgroundNode)

    let background = node.attributes[.background]?.node
    XCTAssertEqual(background?.type, .color)
    XCTAssertEqual(background?.attributes[.value]?.string, "#0000FF")
  }

  func testBackgroundWithAlignment() {
    let backgroundNode = ColorNode("#0000FF")
    let node = TextNode("Test").background(backgroundNode, alignment: .bottomTrailing)

    let dict = node.attributes[.background]?.dict
    XCTAssertNotNil(dict?[.value]?.node)
    XCTAssertEqual(dict?[.alignment]?.string, "bottomTrailing")
  }

  func testMask() {
    let maskNode = CircleNode()
    let node = TextNode("Test").mask(maskNode)

    let mask = node.attributes[.mask]?.node
    XCTAssertEqual(mask?.type, .circle)
  }

  func testMaskWithAlignment() {
    let maskNode = CircleNode()
    let node = TextNode("Test").mask(maskNode, alignment: .center)

    let dict = node.attributes[.mask]?.dict
    XCTAssertNotNil(dict?[.value]?.node)
    XCTAssertEqual(dict?[.alignment]?.string, "center")
  }

  func testClipShape() {
    let shapeNode = RoundedRectangleNode(cornerRadius: 10)
    let node = TextNode("Test").clipShape(shapeNode)

    let clipShape = node.attributes[.clipShape]?.node
    XCTAssertEqual(clipShape?.type, .roundedRectangle)
  }

  func testFillColor() {
    let node = CircleNode().fill("#FF0000")
    XCTAssertEqual(node.attributes[.fill]?.string, "#FF0000")
  }

  func testFillNode() {
    let gradientNode = LinearGradientNode(colors: ["#FF0000", "#0000FF"])
    let node = CircleNode().fill(gradientNode)

    let fill = node.attributes[.fill]?.node
    XCTAssertEqual(fill?.type, .linearGradient)
  }

  func testStrokeColor() {
    let node = CircleNode().stroke("#FF0000")
    XCTAssertEqual(node.attributes[.stroke]?.string, "#FF0000")
  }

  func testStrokeWithLineWidth() {
    let node = CircleNode().stroke("#FF0000", lineWidth: 5)

    let dict = node.attributes[.stroke]?.dict
    XCTAssertEqual(dict?[.color]?.string, "#FF0000")
    XCTAssertEqual(dict?[.lineWidth]?.float, 5)
  }

  func testTrimWithTo() {
    let node = CircleNode().trim(to: 0.75)
    XCTAssertEqual(node.attributes[.trim]?.float, 0.75)
  }

  func testTrimWithFromAndTo() {
    let node = CircleNode().trim(from: 0.25, to: 0.75)

    let dict = node.attributes[.trim]?.dict
    XCTAssertEqual(dict?[.from]?.float, 0.25)
    XCTAssertEqual(dict?[.to]?.float, 0.75)
  }

  func testTrimCanBeCombinedWithStroke() {
    let node = CircleNode()
      .trim(to: 0.5)
      .stroke("#FF0000", lineWidth: 5)

    XCTAssertEqual(node.attributes[.trim]?.float, 0.5)

    let stroke = node.attributes[.stroke]?.dict
    XCTAssertEqual(stroke?[.color]?.string, "#FF0000")
    XCTAssertEqual(stroke?[.lineWidth]?.float, 5)
  }

  func testTrimCanBeCombinedWithFill() {
    let node = RoundedRectangleNode(cornerRadius: 10)
      .trim(from: 0.25, to: 0.75)
      .fill("#0000FF")

    let trim = node.attributes[.trim]?.dict
    XCTAssertEqual(trim?[.from]?.float, 0.25)
    XCTAssertEqual(trim?[.to]?.float, 0.75)
    XCTAssertEqual(node.attributes[.fill]?.string, "#0000FF")
  }

  func testTrimSerialization() throws {
    let node = CircleNode().trim(to: 0.6)
    let data = try JSONEncoder().encode(node)
    let decoded = try JSONDecoder().decode(Node.self, from: data)

    XCTAssertEqual(decoded.type, .circle)
    XCTAssertEqual(decoded.attributes[.trim]?.float, 0.6)
  }

  func testTrimWithFromToSerialization() throws {
    let node = CircleNode().trim(from: 0.2, to: 0.8)
    let data = try JSONEncoder().encode(node)
    let decoded = try JSONDecoder().decode(Node.self, from: data)

    let trim = decoded.attributes[.trim]?.dict
    XCTAssertEqual(trim?[.from]?.float, 0.2)
    XCTAssertEqual(trim?[.to]?.float, 0.8)
  }
}
