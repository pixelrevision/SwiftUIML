import XCTest
@testable import SwiftUIMLCore

final class NodeAccessibilityTests: XCTestCase {
  func testAccessibilityLabel() {
    let node = ImageNode(systemName: "star").accessibilityLabel("Favorite")
    XCTAssertEqual(node.attributes[.accessibilityLabel]?.string, "Favorite")
  }

  func testAccessibilityHint() {
    let node = ButtonNode("Save", onTap: "save")
      .accessibilityHint("Saves the current document")
    XCTAssertEqual(node.attributes[.accessibilityHint]?.string, "Saves the current document")
  }

  func testAccessibilityValue() {
    let node = TextNode("50%").accessibilityValue("50 percent")
    XCTAssertEqual(node.attributes[.accessibilityValue]?.string, "50 percent")
  }

  func testAccessibilityIdentifier() {
    let node = ButtonNode("Submit", onTap: "submit")
      .accessibilityIdentifier("submitButton")
    XCTAssertEqual(node.attributes[.accessibilityIdentifier]?.string, "submitButton")
  }

  func testAccessibilityHidden() {
    let node = ImageNode(systemName: "decorative").accessibilityHidden()
    XCTAssertEqual(node.attributes[.accessibilityHidden]?.bool, true)
  }

  func testAccessibilityHiddenExplicit() {
    let node = TextNode("Visible").accessibilityHidden(false)
    XCTAssertEqual(node.attributes[.accessibilityHidden]?.bool, false)
  }

  func testAccessibilityTraitsSingle() {
    let node = TextNode("Heading").accessibilityTraits("isHeader")
    XCTAssertEqual(node.attributes[.accessibilityTraits]?.string, "isHeader")
  }

  func testAccessibilityTraitsMultiple() {
    let node = ButtonNode("Play", onTap: "play")
      .accessibilityTraits(["isButton", "startsMediaSession"])

    let traits = node.attributes[.accessibilityTraits]?.array?.compactMap { $0.string }
    XCTAssertEqual(traits?.count, 2)
    XCTAssertTrue(traits?.contains("isButton") ?? false)
    XCTAssertTrue(traits?.contains("startsMediaSession") ?? false)
  }

  func testAccessibilityTraitsIsButton() {
    let node = TextNode("Tap me").accessibilityTraits("isButton")
    XCTAssertEqual(node.attributes[.accessibilityTraits]?.string, "isButton")
  }

  func testAccessibilityTraitsIsImage() {
    let node = ImageNode(systemName: "photo").accessibilityTraits("isImage")
    XCTAssertEqual(node.attributes[.accessibilityTraits]?.string, "isImage")
  }

  func testAccessibilitySortPriority() {
    let node = TextNode("First Item").accessibilitySortPriority(1.0)
    XCTAssertEqual(node.attributes[.accessibilitySortPriority]?.float, 1.0)
  }

  func testAccessibilitySortPriorityHigher() {
    let node = TextNode("Important").accessibilitySortPriority(100)
    XCTAssertEqual(node.attributes[.accessibilitySortPriority]?.float, 100)
  }

  func testAccessibilityElementContain() {
    let node = VStackNode {
      TextNode("Title")
      TextNode("Subtitle")
    }
    .accessibilityElement(children: .contain)
    XCTAssertEqual(node.attributes[.accessibilityElement]?.string, "contain")
  }

  func testAccessibilityElementIgnore() {
    let node = VStackNode {
      TextNode("Decorative")
    }
    .accessibilityElement(children: .ignore)
    XCTAssertEqual(node.attributes[.accessibilityElement]?.string, "ignore")
  }

  func testAccessibilityElementCombine() {
    let node = HStackNode {
      TextNode("First")
      TextNode("Second")
    }
    .accessibilityElement(children: .combine)
    XCTAssertEqual(node.attributes[.accessibilityElement]?.string, "combine")
  }

  func testAccessibilityInputLabels() {
    let node = ButtonNode("OK", onTap: "confirm")
      .accessibilityInputLabels(["Okay", "Accept", "Confirm"])

    let labels = node.attributes[.accessibilityInputLabels]?.array?.compactMap { $0.string }
    XCTAssertEqual(labels?.count, 3)
    XCTAssertEqual(labels?[0], "Okay")
    XCTAssertEqual(labels?[1], "Accept")
    XCTAssertEqual(labels?[2], "Confirm")
  }

  func testAccessibilityInputLabelsSingle() {
    let node = TextNode("Submit").accessibilityInputLabels(["Send"])

    let labels = node.attributes[.accessibilityInputLabels]?.array?.compactMap { $0.string }
    XCTAssertEqual(labels?.count, 1)
    XCTAssertEqual(labels?[0], "Send")
  }

  func testAccessibilityRemoveTraitsSingle() {
    let node = TextNode("Not a button").accessibilityRemoveTraits("isButton")
    XCTAssertEqual(node.attributes[.accessibilityRemoveTraits]?.string, "isButton")
  }

  func testAccessibilityRemoveTraitsMultiple() {
    let node = ImageNode(systemName: "photo")
      .accessibilityRemoveTraits(["isButton", "isHeader"])

    let traits = node.attributes[.accessibilityRemoveTraits]?.array?.compactMap { $0.string }
    XCTAssertEqual(traits?.count, 2)
    XCTAssertTrue(traits?.contains("isButton") ?? false)
    XCTAssertTrue(traits?.contains("isHeader") ?? false)
  }

  func testAccessibilityAction() {
    let node = TextNode("Refresh")
      .accessibilityAction(named: "Reload", message: [AttributeKey("action"): "refresh"])

    guard let dict = node.attributes[.accessibilityAction]?.dict else {
      XCTFail("Expected dictionary for accessibilityAction")
      return
    }

    XCTAssertEqual(dict[AttributeKey.name]?.string, "Reload")
    XCTAssertEqual(dict[AttributeKey.message]?.dict?[AttributeKey("action")]?.string, "refresh")
  }

  func testAccessibilityActionWithComplexMessage() {
    let node = ButtonNode("Delete", onTap: "delete")
      .accessibilityAction(named: "Remove", message: [
        AttributeKey("action"): "delete",
        AttributeKey("id"): "123",
        AttributeKey("confirm"): true,
      ])

    guard let dict = node.attributes[.accessibilityAction]?.dict else {
      XCTFail("Expected dictionary for accessibilityAction")
      return
    }

    XCTAssertEqual(dict[AttributeKey.name]?.string, "Remove")

    guard let message = dict[AttributeKey.message]?.dict else {
      XCTFail("Expected message to be a dictionary")
      return
    }

    XCTAssertEqual(message[AttributeKey("action")]?.string, "delete")
    XCTAssertEqual(message[AttributeKey("id")]?.string, "123")
    XCTAssertEqual(message[AttributeKey("confirm")]?.bool, true)
  }

  func testCombinedAccessibilityModifiers() {
    let node = TextNode("Important Item")
      .accessibilityLabel("Critical Item")
      .accessibilityHint("Requires immediate attention")
      .accessibilityTraits(["isButton", "isHeader"])
      .accessibilityRemoveTraits("isImage")
      .accessibilitySortPriority(10)
      .accessibilityInputLabels(["Essential", "Priority"])
      .accessibilityAction(named: "Handle", message: [AttributeKey("action"): "process"])

    XCTAssertEqual(node.attributes[AttributeKey.accessibilityLabel]?.string, "Critical Item")
    XCTAssertEqual(node.attributes[AttributeKey.accessibilityHint]?.string, "Requires immediate attention")
    XCTAssertNotNil(node.attributes[AttributeKey.accessibilityTraits]?.array)
    XCTAssertEqual(node.attributes[AttributeKey.accessibilityRemoveTraits]?.string, "isImage")
    XCTAssertEqual(node.attributes[AttributeKey.accessibilitySortPriority]?.float, 10)
    XCTAssertNotNil(node.attributes[AttributeKey.accessibilityInputLabels]?.array)
    XCTAssertNotNil(node.attributes[AttributeKey.accessibilityAction]?.dict)
  }
}
