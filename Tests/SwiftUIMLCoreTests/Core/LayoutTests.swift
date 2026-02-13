import XCTest
@testable import SwiftUIMLCore

class LayoutTests: XCTestCase {
  let styles: Layout.Styles = [
    "green-background": [
      .backgroundColor: "green",
    ],
    "with-inherit-first": [
      .inherit: "green-background",
      .foregroundColor: "red",
    ],
    "with-inherit-after": [
      .foregroundColor: "red",
      .inherit: "green-background",
    ],
    "multiple-values": [
      .foregroundColor: "orange",
      .backgroundColor: "black",
      .fontWeight: 10,
    ],
    "merged-with-multiple": [
      .custom("before"): .null,
      .inherit: "multiple-values",
      .custom("after"): .null,
    ],
    "invalid-inherit": [
      .custom("before"): .null,
      .inherit: "not-an-actual-style",
      .custom("after"): .null,
    ],
  ]

  func testBasicStyleApplication() throws {
    let layout = Layout(
      styles: styles,
      content: TextNode("Test")
        .style("green-background")
    )
    let resolved = layout.resolve()
    XCTAssertEqual(resolved.attributes[.backgroundColor], "green")
    XCTAssertEqual(
      resolved.attributes.firstIndex(forKey: .backgroundColor),
      1,
      "Style should be applied immediately after text"
    )
  }

  func testBasicInheritance() {
    let layout = Layout(
      styles: styles,
      content: TextNode("Test")
        .style("with-inherit-first")
    )
    let resolved = layout.resolve()
    XCTAssertEqual(resolved.attributes[.backgroundColor], "green")
    XCTAssertEqual(resolved.attributes[.foregroundColor], "red")
    XCTAssertEqual(
      resolved.attributes.firstIndex(forKey: .backgroundColor),
      1,
      "Style should be applied immediately after text"
    )
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .foregroundColor), 2, "Style should proceed inherited style")
  }

  func testOrderedInheritance() {
    let layout = Layout(
      styles: styles,
      content: TextNode("Test")
        .style("with-inherit-after")
    )
    let resolved = layout.resolve()
    XCTAssertEqual(resolved.attributes[.backgroundColor], "green")
    XCTAssertEqual(resolved.attributes[.foregroundColor], "red")
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .foregroundColor), 1, "Style should apply first")
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .backgroundColor), 2, "Inherited style should follow")
  }

  func testChildrenApplied() throws {
    let layout = Layout(
      styles: styles,
      content: VStackNode {
        HStackNode {
          TextNode("Child")
            .style("green-background")
        }
      }
    )
    let resolved = layout.resolve()
    let child = try XCTUnwrap(resolved.children?.first?.children?.first)
    XCTAssertEqual(child.attributes[.backgroundColor], "green")
  }

  func testMultipleValuesApplied() {
    let layout = Layout(
      styles: styles,
      content: TextNode("Test")
        .style("merged-with-multiple")
    )
    let resolved = layout.resolve()
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .custom("before")), 1)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .foregroundColor), 2)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .backgroundColor), 3)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .fontWeight), 4)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .custom("after")), 5)
  }

  func testRemovesInvalidInherit() throws {
    let layout = Layout(
      styles: styles,
      content: TextNode("Test")
        .style("invalid-inherit")
    )
    let resolved = layout.resolve()
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .custom("before")), 1)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .custom("after")), 2)
  }

  func testRemovesInvalidStyle() throws {
    let layout = Layout(
      styles: styles,
      content: TextNode("Test")
        .style("invalid-style")
        .id("id-after")
    )
    let resolved = layout.resolve()
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .id), 1)
  }

  func testNodeAttributeOverridesStyleAttribute() throws {
    let layout = Layout(
      styles: [
        "red-theme": [
          .foregroundColor: "red",
          .backgroundColor: "white",
        ],
      ],
      content: TextNode("Test")
        .foregroundColor("blue")
        .style("red-theme")
    )
    let resolved = layout.resolve()
    // Node's foregroundColor should override style's foregroundColor
    XCTAssertEqual(resolved.attributes[.foregroundColor], "blue")
    // Style's backgroundColor should still be applied
    XCTAssertEqual(resolved.attributes[.backgroundColor], "white")
    // Node's attribute should maintain its position (before style)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .text), 0)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .foregroundColor), 1)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .backgroundColor), 2)
  }

  func testChainedInheritance() throws {
    let layout = Layout(
      styles: [
        "base": [
          .backgroundColor: "white"
        ],
        "theme": [
          .inherit: "base",
          .foregroundColor: "black",
        ],
        "extended": [
          .inherit: "theme",
          .fontWeight: 10,
        ],
      ],
      content: TextNode("Test")
        .style("extended")
    )
    let resolved = layout.resolve()
    
    // Should have all three levels of attributes
    XCTAssertEqual(resolved.attributes[.backgroundColor], "white", "Should inherit from base")
    XCTAssertEqual(resolved.attributes[.foregroundColor], "black", "Should inherit from theme")
    XCTAssertEqual(resolved.attributes[.fontWeight], .number(10), "Should have own attribute")
    
    // Order should be: text, backgroundColor (from base via theme), foregroundColor (from theme), fontWeight (own)
    // When "extended" style has inherit at position 0, it gets replaced with "theme"'s resolved attributes
    // "theme" has backgroundColor (from base) at position 0, foregroundColor at position 1
    // Then fontWeight comes after
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .text), 0)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .backgroundColor), 1)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .foregroundColor), 2)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .fontWeight), 3)
  }

  func testCircularInheritance() throws {
    let layout = Layout(
      styles: [
        "styleA": [
          .inherit: "styleB",
          .foregroundColor: "red",
        ],
        "styleB": [
          .inherit: "styleA",
          .backgroundColor: "blue",
        ],
      ],
      content: TextNode("Test")
        .style("styleA")
    )
    let resolved = layout.resolve()
    
    // Should break the circular dependency gracefully
    // When styleA tries to inherit from styleB, and styleB tries to inherit from styleA,
    // the second one encountered should just use its own attributes without the inherit
    XCTAssertEqual(resolved.attributes[.foregroundColor], "red", "Should have styleA's own attribute")
    XCTAssertEqual(resolved.attributes[.backgroundColor], "blue", "Should have styleB's attribute")
    
    // Both styles should be present (circular dependency handled)
    XCTAssertNotNil(resolved.attributes[.foregroundColor])
    XCTAssertNotNil(resolved.attributes[.backgroundColor])
  }

  func testIgnoresNonStringValue() throws {
    let layout = Layout(
      styles: [
        "base": [.foregroundColor: "red"],
        "added": [
          .inherit: .number(20),
          .backgroundColor: "green",
        ],
      ],
      content: TextNode("Test")
        .style("added")
    )
    let resolved = layout.resolve()
    XCTAssertNil(resolved.attributes[.foregroundColor])
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .backgroundColor), 1)
  }

  func testEmptyStylesDoNotModify() throws {
    let layout = Layout(
      styles: [:],
      content: TextNode("Test")
        .style("added")
        .id("an-id")
    )
    let resolved = layout.resolve()
    XCTAssertEqual(resolved.attributes.count, 2)
    XCTAssertNotNil(resolved.attributes[.id])
    XCTAssertNotNil(resolved.attributes[.text])
    XCTAssertNil(resolved.attributes[.style])
  }

  func testInvalidStyleRemoved() throws {
    let layout = Layout(
      styles: ["not-applied": [.foregroundColor: "red"]],
      content: Node(type: .text, attributes: [
        .style: .number(100),
        .text: "Test",
        .id: "an-id",
      ])
    )
    let resolved = layout.resolve()
    XCTAssertEqual(resolved.attributes.count, 2)
    XCTAssertNotNil(resolved.attributes[.id])
    XCTAssertNotNil(resolved.attributes[.text])
    XCTAssertNil(resolved.attributes[.style])
  }

  func testNoStyleApplied() throws {
    let layout = Layout(
      styles: ["not-applied": [.foregroundColor: "red"]],
      content: Node(type: .text, attributes: [
        .text: "Test",
        .id: "an-id",
      ])
    )
    let resolved = layout.resolve()
    XCTAssertEqual(resolved.attributes.count, 2)
    XCTAssertNotNil(resolved.attributes[.id])
    XCTAssertNotNil(resolved.attributes[.text])
  }

  func testStyleOverrideDuringInheritance() throws {
    let layout = Layout(
      styles: [
        "parent": [
          .foregroundColor: "red",
          .backgroundColor: "white",
        ],
        "child": [
          .inherit: "parent",
          .foregroundColor: "blue",  // Overrides parent's red
        ],
      ],
      content: TextNode("Test")
        .style("child")
    )
    let resolved = layout.resolve()
    
    // Child's foregroundColor should override parent's
    XCTAssertEqual(resolved.attributes[.foregroundColor], "blue", "Child should override parent")
    XCTAssertEqual(resolved.attributes[.backgroundColor], "white", "Should keep parent's backgroundColor")
    
    // Order: text, foregroundColor (child's value), backgroundColor (from parent)
    // When "child" has inherit at position 0, parent attrs get inserted there
    // But then child's foregroundColor at position 1 should override parent's
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .text), 0)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .backgroundColor), 1)
    XCTAssertEqual(resolved.attributes.firstIndex(forKey: .foregroundColor), 2)
  }
}
