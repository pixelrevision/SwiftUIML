import XCTest
@testable import SwiftUIMLCore

final class NodeLayoutTests: XCTestCase {
  func testId() {
    let node = TextNode("Test").id("my-id")
    XCTAssertEqual(node.attributes[.id]?.string, "my-id")
  }

  func testPaddingUniform() {
    let node = TextNode("Test").padding(10)
    XCTAssertEqual(node.attributes[.padding]?.float, 10)
  }

  func testPaddingEdges() {
    let node = TextNode("Test").padding(top: 5, leading: 10, bottom: 15, trailing: 20)
    let dict = node.attributes[.padding]?.dict
    XCTAssertEqual(dict?[.top]?.float, 5)
    XCTAssertEqual(dict?[.leading]?.float, 10)
    XCTAssertEqual(dict?[.bottom]?.float, 15)
    XCTAssertEqual(dict?[.trailing]?.float, 20)
  }

  func testFrameSimple() {
    let node = TextNode("Test").frame(width: 100, height: 200)
    let dict = node.attributes[.frame]?.dict
    XCTAssertEqual(dict?[.width]?.float, 100)
    XCTAssertEqual(dict?[.height]?.float, 200)
  }

  func testFrameWithAlignment() {
    let node = TextNode("Test").frame(width: 100, height: 200, alignment: .topLeading)
    let dict = node.attributes[.frame]?.dict
    XCTAssertEqual(dict?[.width]?.float, 100)
    XCTAssertEqual(dict?[.height]?.float, 200)
    XCTAssertEqual(dict?[.alignment]?.string, "topLeading")
  }

  func testFrameWithConstraints() {
    let node = TextNode("Test").frame(
      minWidth: 50,
      idealWidth: 100,
      maxWidth: 200,
      minHeight: 30,
      idealHeight: 60,
      maxHeight: 120,
      alignment: .center
    )
    let dict = node.attributes[.frame]?.dict
    XCTAssertEqual(dict?[.minWidth]?.float, 50)
    XCTAssertEqual(dict?[.idealWidth]?.float, 100)
    XCTAssertEqual(dict?[.maxWidth]?.float, 200)
    XCTAssertEqual(dict?[.minHeight]?.float, 30)
    XCTAssertEqual(dict?[.idealHeight]?.float, 60)
    XCTAssertEqual(dict?[.maxHeight]?.float, 120)
    XCTAssertEqual(dict?[.alignment]?.string, "center")
  }

  func testFixedSize() {
    let node = TextNode("Test").fixedSize()
    XCTAssertEqual(node.attributes[.fixedSize]?.bool, true)
  }

  func testFixedSizeAxes() {
    let node = TextNode("Test").fixedSize(horizontal: true, vertical: false)
    let dict = node.attributes[.fixedSize]?.dict
    XCTAssertEqual(dict?[.horizontal]?.bool, true)
    XCTAssertEqual(dict?[.vertical]?.bool, false)
  }

  func testOffsetXY() {
    let node = TextNode("Test").offset(x: 10, y: 20)
    let dict = node.attributes[.offset]?.dict
    XCTAssertEqual(dict?[.x]?.float, 10)
    XCTAssertEqual(dict?[.y]?.float, 20)
  }

  func testOffsetUniform() {
    let node = TextNode("Test").offset(15)
    XCTAssertEqual(node.attributes[.offset]?.float, 15)
  }

  func testPosition() {
    let node = TextNode("Test").position(x: 50, y: 100)
    let dict = node.attributes[.position]?.dict
    XCTAssertEqual(dict?[.x]?.float, 50)
    XCTAssertEqual(dict?[.y]?.float, 100)
  }

  func testRotationEffectDegrees() {
    let node = TextNode("Test").rotationEffect(degrees: 45)
    let dict = node.attributes[.rotationEffect]?.dict
    XCTAssertEqual(dict?[.degrees]?.float, 45)
    XCTAssertEqual(dict?[.anchor]?.string, "center")
  }

  func testRotationEffectDegreesWithAnchor() {
    let node = TextNode("Test").rotationEffect(degrees: 90, anchor: .topLeading)
    let dict = node.attributes[.rotationEffect]?.dict
    XCTAssertEqual(dict?[.degrees]?.float, 90)
    XCTAssertEqual(dict?[.anchor]?.string, "topLeading")
  }

  func testRotationEffectRadians() {
    let node = TextNode("Test").rotationEffect(radians: 3.14)
    let dict = node.attributes[.rotationEffect]?.dict
    XCTAssertEqual(dict?[.radians]?.float, 3.14)
    XCTAssertEqual(dict?[.anchor]?.string, "center")
  }

  func testRotationEffectRadiansWithAnchor() {
    let node = TextNode("Test").rotationEffect(radians: 1.57, anchor: .bottomTrailing)
    let dict = node.attributes[.rotationEffect]?.dict
    XCTAssertEqual(dict?[.radians]?.float, 1.57)
    XCTAssertEqual(dict?[.anchor]?.string, "bottomTrailing")
  }

  func testScaleEffectUniform() {
    let node = TextNode("Test").scaleEffect(2.0)
    XCTAssertEqual(node.attributes[.scaleEffect]?.float, 2.0)
  }

  func testScaleEffectXY() {
    let node = TextNode("Test").scaleEffect(x: 1.5, y: 0.5)
    let dict = node.attributes[.scaleEffect]?.dict
    XCTAssertEqual(dict?[.x]?.float, 1.5)
    XCTAssertEqual(dict?[.y]?.float, 0.5)
    XCTAssertEqual(dict?[.anchor]?.string, "center")
  }

  func testScaleEffectXYWithAnchor() {
    let node = TextNode("Test").scaleEffect(x: 2.0, y: 3.0, anchor: .leading)
    let dict = node.attributes[.scaleEffect]?.dict
    XCTAssertEqual(dict?[.x]?.float, 2.0)
    XCTAssertEqual(dict?[.y]?.float, 3.0)
    XCTAssertEqual(dict?[.anchor]?.string, "leading")
  }

  func testGridCellColumns() {
    let node = TextNode("Test").gridCellColumns(3)
    XCTAssertEqual(node.attributes[.gridCellColumns]?.int, 3)
  }

  func testResponsive() {
    let node = TextNode("Test").responsive([
      .sm: [.padding: .number(8)],
      .md: [.padding: .number(16)],
    ])

    let array = node.attributes[.responsive]?.array
    XCTAssertNotNil(array)
    XCTAssertEqual(array?.count, 2)

    // Check first breakpoint (sm breakpoint keeps its pattern as "sm")
    let first = array?.first?.dict
    XCTAssertEqual(first?[.init("pattern")]?.string, "sm")

    // Check attributes array format
    let firstAttrs = first?[.init("attributes")]?.array
    XCTAssertNotNil(firstAttrs)
  }

  func testContainerRelativeFrameDefaults() {
    let node = TextNode("Test").containerRelativeFrame(.horizontal, count: 12)
    let dict = node.attributes[.containerRelativeFrame]?.dict
    XCTAssertEqual(dict?[.axis]?.string, "horizontal")
    XCTAssertEqual(dict?[.init("count")]?.int, 12)
    XCTAssertEqual(dict?[.init("span")]?.int, 1, "Default span should be 1")
    XCTAssertEqual(dict?[.spacing]?.float, 0, "Default spacing should be 0")
    XCTAssertEqual(dict?[.alignment]?.string, "center", "Default alignment should be center")
  }

  func testContainerRelativeFrameAllParams() {
    let node = TextNode("Test").containerRelativeFrame(
      .horizontal,
      count: 12,
      span: 8,
      spacing: 10,
      alignment: .topLeading
    )
    let dict = node.attributes[.containerRelativeFrame]?.dict
    XCTAssertEqual(dict?[.axis]?.string, "horizontal")
    XCTAssertEqual(dict?[.init("count")]?.int, 12)
    XCTAssertEqual(dict?[.init("span")]?.int, 8)
    XCTAssertEqual(dict?[.spacing]?.float, 10)
    XCTAssertEqual(dict?[.alignment]?.string, "topLeading")
  }

  func testLayoutPriorityZero() {
    let node = TextNode("Test").layoutPriority(0)
    XCTAssertEqual(node.attributes[.layoutPriority]?.float, 0)
  }

  func testLayoutPriorityOne() {
    let node = TextNode("Test").layoutPriority(1)
    XCTAssertEqual(node.attributes[.layoutPriority]?.float, 1)
  }

  func testLayoutPriorityCustom() {
    let node = TextNode("Test").layoutPriority(2.5)
    XCTAssertEqual(node.attributes[.layoutPriority]?.float, 2.5)
  }

  func testCoordinateSpace() {
    let node = TextNode("Test").coordinateSpace("mySpace")
    XCTAssertEqual(node.attributes[.coordinateSpace]?.string, "mySpace")
  }

  func testStyle() {
    let node = TextNode("Test").style("heading")
    XCTAssertEqual(node.attributes[.style]?.string, "heading")
  }

  func testSafeAreaInsetTop() {
    let content = TextNode("Inset")
    let node = ColorNode("blue").safeAreaInset(edge: .top, content: content)
    let dict = node.attributes[.safeAreaInset]?.dict
    XCTAssertEqual(dict?[.init("edge")]?.string, "top")
    XCTAssertEqual(dict?[.alignment]?.string, "center")
    XCTAssertNotNil(dict?[.content]?.node)
  }

  func testSafeAreaInsetWithSpacing() {
    let content = TextNode("Inset")
    let node = ColorNode("blue").safeAreaInset(edge: .bottom, spacing: 20, content: content)
    let dict = node.attributes[.safeAreaInset]?.dict
    XCTAssertEqual(dict?[.init("edge")]?.string, "bottom")
    XCTAssertEqual(dict?[.spacing]?.float, 20)
  }

  func testSafeAreaInsetWithAlignment() {
    let content = TextNode("Inset")
    let node = ColorNode("blue").safeAreaInset(edge: .top, alignment: .leading, content: content)
    let dict = node.attributes[.safeAreaInset]?.dict
    XCTAssertEqual(dict?[.alignment]?.string, "leading")
  }

  func testToolbar() {
    let node = ColorNode("blue").toolbar {
      TextNode("Button 1")
      TextNode("Button 2")
    }
    let toolbarNode = node.attributes[.toolbar]?.node
    XCTAssertNotNil(toolbarNode)
    XCTAssertEqual(toolbarNode?.children?.count, 2)
  }
}
