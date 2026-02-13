import XCTest
@testable import SwiftUIMLCore

final class NodeTextTests: XCTestCase {
  func testFontStyle() {
    let node = TextNode("Test").font(.title)
    XCTAssertEqual(node.attributes[.font]?.string, "title")
  }

  func testFontStyleBody() {
    let node = TextNode("Test").font(.body)
    XCTAssertEqual(node.attributes[.font]?.string, "body")
  }

  func testSystemFont() {
    let node = TextNode("Test").font(size: 16)

    let dict = node.attributes[.font]?.dict
    XCTAssertEqual(dict?[.type]?.string, "system")
    XCTAssertEqual(dict?[.size]?.float, 16)
  }

  func testSystemFontWithWeight() {
    let node = TextNode("Test").font(size: 16, weight: .bold)

    let dict = node.attributes[.font]?.dict
    XCTAssertEqual(dict?[.type]?.string, "system")
    XCTAssertEqual(dict?[.size]?.float, 16)
    XCTAssertEqual(dict?[.weight]?.string, "bold")
  }

  func testSystemFontWithDesign() {
    let node = TextNode("Test").font(size: 16, design: .rounded)

    let dict = node.attributes[.font]?.dict
    XCTAssertEqual(dict?[.type]?.string, "system")
    XCTAssertEqual(dict?[.size]?.float, 16)
    XCTAssertEqual(dict?[.design]?.string, "rounded")
  }

  func testSystemFontWithWeightAndDesign() {
    let node = TextNode("Test").font(size: 16, weight: .semibold, design: .monospaced)

    let dict = node.attributes[.font]?.dict
    XCTAssertEqual(dict?[.type]?.string, "system")
    XCTAssertEqual(dict?[.size]?.float, 16)
    XCTAssertEqual(dict?[.weight]?.string, "semibold")
    XCTAssertEqual(dict?[.design]?.string, "monospaced")
  }

  func testCustomFont() {
    let node = TextNode("Test").customFont(name: "Helvetica", size: 18)

    let dict = node.attributes[.font]?.dict
    XCTAssertEqual(dict?[.name]?.string, "Helvetica")
    XCTAssertEqual(dict?[.size]?.float, 18)
  }

  func testCustomFontWithRelativeTo() {
    let node = TextNode("Test").customFont(name: "Helvetica", size: 18, relativeTo: .body)

    let dict = node.attributes[.font]?.dict
    XCTAssertEqual(dict?[.name]?.string, "Helvetica")
    XCTAssertEqual(dict?[.size]?.float, 18)
    XCTAssertEqual(dict?[.relativeTo]?.string, "body")
  }

  func testCustomFontFixed() {
    let node = TextNode("Test").customFont(name: "Helvetica", fixedSize: 20)

    let dict = node.attributes[.font]?.dict
    XCTAssertEqual(dict?[.name]?.string, "Helvetica")
    XCTAssertEqual(dict?[.fixedSize]?.float, 20)
  }

  func testLineLimit() {
    let node = TextNode("Test").lineLimit(3)
    XCTAssertEqual(node.attributes[.lineLimit]?.int, 3)
  }

  func testLineLimitOne() {
    let node = TextNode("Test").lineLimit(1)
    XCTAssertEqual(node.attributes[.lineLimit]?.int, 1)
  }

  func testMultilineTextAlignment() {
    let node = TextNode("Test").multilineTextAlignment(.leading)
    XCTAssertEqual(node.attributes[.multilineTextAlignment]?.string, "leading")
  }

  func testMultilineTextAlignmentCenter() {
    let node = TextNode("Test").multilineTextAlignment(.center)
    XCTAssertEqual(node.attributes[.multilineTextAlignment]?.string, "center")
  }

  func testMultilineTextAlignmentTrailing() {
    let node = TextNode("Test").multilineTextAlignment(.trailing)
    XCTAssertEqual(node.attributes[.multilineTextAlignment]?.string, "trailing")
  }

  func testBold() {
    let node = TextNode("Test").bold()
    XCTAssertEqual(node.attributes[.bold]?.bool, true)
  }

  func testItalic() {
    let node = TextNode("Test").italic()
    XCTAssertEqual(node.attributes[.italic]?.bool, true)
  }

  func testBoldAndItalic() {
    let node = TextNode("Test").bold().italic()
    XCTAssertEqual(node.attributes[.bold]?.bool, true)
    XCTAssertEqual(node.attributes[.italic]?.bool, true)
  }

  func testUnderline() {
    let node = TextNode("Test").underline()
    XCTAssertEqual(node.attributes[.underline]?.bool, true)
  }

  func testUnderlineWithColor() {
    let node = TextNode("Test").underline(color: "#FF0000")
    let dict = node.attributes[.underline]?.dict
    XCTAssertEqual(dict?[.isActive]?.bool, true)
    XCTAssertEqual(dict?[.color]?.string, "#FF0000")
  }

  func testUnderlineInactive() {
    let node = TextNode("Test").underline(false)
    let dict = node.attributes[.underline]?.dict
    XCTAssertEqual(dict?[.isActive]?.bool, false)
  }

  func testStrikethrough() {
    let node = TextNode("Test").strikethrough()
    XCTAssertEqual(node.attributes[.strikethrough]?.bool, true)
  }

  func testStrikethroughWithColor() {
    let node = TextNode("Test").strikethrough(color: "#FF0000")
    let dict = node.attributes[.strikethrough]?.dict
    XCTAssertEqual(dict?[.isActive]?.bool, true)
    XCTAssertEqual(dict?[.color]?.string, "#FF0000")
  }

  func testStrikethroughInactive() {
    let node = TextNode("Test").strikethrough(false)
    let dict = node.attributes[.strikethrough]?.dict
    XCTAssertEqual(dict?[.isActive]?.bool, false)
  }

  func testFontWeight() {
    let node = TextNode("Test").fontWeight(.medium)
    XCTAssertEqual(node.attributes[.fontWeight]?.string, "medium")
  }

  func testTextSelection() {
    let node = TextNode("Test").textSelection(.enabled)
    XCTAssertEqual(node.attributes[.textSelection]?.string, "enabled")
  }

  func testTextSelectionDisabled() {
    let node = TextNode("Test").textSelection(.disabled)
    XCTAssertEqual(node.attributes[.textSelection]?.string, "disabled")
  }

  func testKerning() {
    let node = TextNode("Test").kerning(2)
    XCTAssertEqual(node.attributes[.kerning]?.float, 2)
  }

  func testKerningNegative() {
    let node = TextNode("Test").kerning(-1.5)
    XCTAssertEqual(node.attributes[.kerning]?.float, -1.5)
  }

  func testKerningZero() {
    let node = TextNode("Test").kerning(0)
    XCTAssertEqual(node.attributes[.kerning]?.float, 0)
  }

  func testTracking() {
    let node = TextNode("Test").tracking(2)
    XCTAssertEqual(node.attributes[.tracking]?.float, 2)
  }

  func testTrackingNegative() {
    let node = TextNode("Test").tracking(-1.5)
    XCTAssertEqual(node.attributes[.tracking]?.float, -1.5)
  }

  func testTrackingZero() {
    let node = TextNode("Test").tracking(0)
    XCTAssertEqual(node.attributes[.tracking]?.float, 0)
  }

  func testLineSpacing() {
    let node = TextNode("Test").lineSpacing(5)
    XCTAssertEqual(node.attributes[.lineSpacing]?.float, 5)
  }

  func testLineSpacingLarge() {
    let node = TextNode("Test").lineSpacing(15)
    XCTAssertEqual(node.attributes[.lineSpacing]?.float, 15)
  }

  func testLineSpacingZero() {
    let node = TextNode("Test").lineSpacing(0)
    XCTAssertEqual(node.attributes[.lineSpacing]?.float, 0)
  }

  func testTruncationModeTail() {
    let node = TextNode("Test").truncationMode(.tail)
    XCTAssertEqual(node.attributes[.truncationMode]?.string, "tail")
  }

  func testTruncationModeMiddle() {
    let node = TextNode("Test").truncationMode(.middle)
    XCTAssertEqual(node.attributes[.truncationMode]?.string, "middle")
  }

  func testTruncationModeHead() {
    let node = TextNode("Test").truncationMode(.head)
    XCTAssertEqual(node.attributes[.truncationMode]?.string, "head")
  }

  func testMinimumScaleFactor() {
    let node = TextNode("Test").minimumScaleFactor(0.5)
    XCTAssertEqual(node.attributes[.minimumScaleFactor]?.float, 0.5)
  }

  func testMinimumScaleFactorOne() {
    let node = TextNode("Test").minimumScaleFactor(1.0)
    XCTAssertEqual(node.attributes[.minimumScaleFactor]?.float, 1.0)
  }

  func testMinimumScaleFactorSmall() {
    let node = TextNode("Test").minimumScaleFactor(0.2)
    XCTAssertEqual(node.attributes[.minimumScaleFactor]?.float, 0.2)
  }

  func testAllowsTighteningDefault() {
    let node = TextNode("Test").allowsTightening()
    XCTAssertEqual(node.attributes[.allowsTightening]?.bool, true)
  }

  func testAllowsTighteningTrue() {
    let node = TextNode("Test").allowsTightening(true)
    XCTAssertEqual(node.attributes[.allowsTightening]?.bool, true)
  }

  func testAllowsTighteningFalse() {
    let node = TextNode("Test").allowsTightening(false)
    XCTAssertEqual(node.attributes[.allowsTightening]?.bool, false)
  }

  func testBaselineOffsetPositive() {
    let node = TextNode("Test").baselineOffset(10)
    XCTAssertEqual(node.attributes[.baselineOffset]?.float, 10)
  }

  func testBaselineOffsetNegative() {
    let node = TextNode("Test").baselineOffset(-5)
    XCTAssertEqual(node.attributes[.baselineOffset]?.float, -5)
  }

  func testBaselineOffsetZero() {
    let node = TextNode("Test").baselineOffset(0)
    XCTAssertEqual(node.attributes[.baselineOffset]?.float, 0)
  }
}
