import XCTest
@testable import SwiftUIMLCore

final class Node3DTransformTests: XCTestCase {
  func testRotation3DEffectDegrees() {
    let node = TextNode("Test").rotation3DEffect(
      degrees: 45,
      axis: (x: 1, y: 0, z: 0)
    )

    let dict = node.attributes[.rotation3DEffect]?.dict
    XCTAssertNotNil(dict)
    XCTAssertEqual(dict?[.degrees]?.cgFloat, 45)
    XCTAssertEqual(dict?[.x]?.cgFloat, 1)
    XCTAssertEqual(dict?[.y]?.cgFloat, 0)
    XCTAssertEqual(dict?[.z]?.cgFloat, 0)
    XCTAssertEqual(dict?[.anchor]?.string, "center")
    XCTAssertEqual(dict?[.anchorZ]?.cgFloat, 0)
    XCTAssertEqual(dict?[.perspective]?.cgFloat, 1)
  }

  func testRotation3DEffectDegreesWithAllParams() {
    let node = TextNode("Test").rotation3DEffect(
      degrees: 90,
      axis: (x: 0, y: 1, z: 0),
      anchor: .topLeading,
      anchorZ: 10,
      perspective: 0.5
    )

    let dict = node.attributes[.rotation3DEffect]?.dict
    XCTAssertNotNil(dict)
    XCTAssertEqual(dict?[.degrees]?.cgFloat, 90)
    XCTAssertEqual(dict?[.x]?.cgFloat, 0)
    XCTAssertEqual(dict?[.y]?.cgFloat, 1)
    XCTAssertEqual(dict?[.z]?.cgFloat, 0)
    XCTAssertEqual(dict?[.anchor]?.string, "topLeading")
    XCTAssertEqual(dict?[.anchorZ]?.cgFloat, 10)
    XCTAssertEqual(dict?[.perspective]?.cgFloat, 0.5)
  }

  func testRotation3DEffectRadians() {
    let node = TextNode("Test").rotation3DEffect(
      radians: 1.57,
      axis: (x: 0, y: 0, z: 1)
    )

    let dict = node.attributes[.rotation3DEffect]?.dict
    XCTAssertNotNil(dict)
    XCTAssertEqual(dict?[.radians]?.cgFloat, 1.57)
    XCTAssertEqual(dict?[.x]?.cgFloat, 0)
    XCTAssertEqual(dict?[.y]?.cgFloat, 0)
    XCTAssertEqual(dict?[.z]?.cgFloat, 1)
    XCTAssertEqual(dict?[.anchor]?.string, "center")
    XCTAssertEqual(dict?[.anchorZ]?.cgFloat, 0)
    XCTAssertEqual(dict?[.perspective]?.cgFloat, 1)
  }

  func testRotation3DEffectRadiansWithAllParams() {
    let node = TextNode("Test").rotation3DEffect(
      radians: 3.14,
      axis: (x: 1, y: 1, z: 0),
      anchor: .bottomTrailing,
      anchorZ: 5,
      perspective: 0.8
    )

    let dict = node.attributes[.rotation3DEffect]?.dict
    XCTAssertNotNil(dict)
    XCTAssertEqual(dict?[.radians]?.cgFloat, 3.14)
    XCTAssertEqual(dict?[.x]?.cgFloat, 1)
    XCTAssertEqual(dict?[.y]?.cgFloat, 1)
    XCTAssertEqual(dict?[.z]?.cgFloat, 0)
    XCTAssertEqual(dict?[.anchor]?.string, "bottomTrailing")
    XCTAssertEqual(dict?[.anchorZ]?.cgFloat, 5)
    XCTAssertEqual(dict?[.perspective]?.cgFloat, 0.8)
  }

  func testPerspective() {
    let node = TextNode("Test").perspective(0.5)

    let perspective = node.attributes[.perspective]?.cgFloat
    XCTAssertEqual(perspective, 0.5)
  }

  func testPerspectiveWithDifferentValues() {
    let node1 = TextNode("Test").perspective(0.2)
    XCTAssertEqual(node1.attributes[.perspective]?.cgFloat, 0.2)

    let node2 = TextNode("Test").perspective(1.0)
    XCTAssertEqual(node2.attributes[.perspective]?.cgFloat, 1.0)

    let node3 = TextNode("Test").perspective(2.0)
    XCTAssertEqual(node3.attributes[.perspective]?.cgFloat, 2.0)
  }
}
