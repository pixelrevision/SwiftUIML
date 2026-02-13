import XCTest
@testable import SwiftUIMLCore

final class NodeTabsTests: XCTestCase {
  func testTabItemBoth() {
    let node = TextNode("Test").tabItem("star", text: "Favorites")

    let dict = node.attributes[.tabItem]?.dict
    XCTAssertEqual(dict?[.systemName]?.string, "star")
    XCTAssertEqual(dict?[.text]?.string, "Favorites")
  }

  func testTabItemIconOnly() {
    let node = TextNode("Test").tabItem("star")

    let dict = node.attributes[.tabItem]?.dict
    XCTAssertEqual(dict?[.systemName]?.string, "star")
    XCTAssertNil(dict?[.text])
  }

  func testTabItemTextOnly() {
    let node = TextNode("Test").tabItem(nil, text: "Favorites")

    let dict = node.attributes[.tabItem]?.dict
    XCTAssertNil(dict?[.systemName])
    XCTAssertEqual(dict?[.text]?.string, "Favorites")
  }

  func testTabItemDict() {
    let customDict: [AttributeKey: AttributeValue] = [
      .systemName: "heart",
      .text: "Likes",
    ]
    let node = TextNode("Test").tabItem(customDict)

    let dict = node.attributes[.tabItem]?.dict
    XCTAssertEqual(dict?[.systemName]?.string, "heart")
    XCTAssertEqual(dict?[.text]?.string, "Likes")
  }

  func testTagString() {
    let node = TextNode("Test").tag("tab1")
    XCTAssertEqual(node.attributes[.tag]?.string, "tab1")
  }

  func testTagInt() {
    let node = TextNode("Test").tag(1)
    XCTAssertEqual(node.attributes[.tag]?.int, 1)
  }

  func testTagZero() {
    let node = TextNode("Test").tag(0)
    XCTAssertEqual(node.attributes[.tag]?.int, 0)
  }

  func testTabViewStyleAutomatic() {
    let node = TabViewNode {
      TextNode("Page 1")
      TextNode("Page 2")
    }
    .tabViewStyle(.automatic)

    XCTAssertEqual(node.attributes[.tabViewStyle]?.string, "automatic")
  }

  func testTabViewStylePage() {
    let node = TabViewNode {
      TextNode("Page 1")
      TextNode("Page 2")
    }
    .tabViewStyle(.page)

    XCTAssertEqual(node.attributes[.tabViewStyle]?.string, "page")
  }

  func testTabViewStyleChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .tabViewStyle(.page)
    .padding(20)

    XCTAssertEqual(node.attributes[.tabViewStyle]?.string, "page")
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testTabViewStyleOnDifferentViewTypes() {
    // Test that tabViewStyle can be applied to any node
    let textNode = TextNode("Test").tabViewStyle(.automatic)
    let stackNode = HStackNode {
      TextNode("A")
      TextNode("B")
    }.tabViewStyle(.page)

    XCTAssertEqual(textNode.attributes[.tabViewStyle]?.string, "automatic")
    XCTAssertEqual(stackNode.attributes[.tabViewStyle]?.string, "page")
  }

  func testBadgeString() {
    let node = TextNode("Test").badge("New")
    XCTAssertEqual(node.attributes[.badge]?.string, "New")
  }

  func testBadgeStringNumber() {
    let node = TextNode("Test").badge("99+")
    XCTAssertEqual(node.attributes[.badge]?.string, "99+")
  }

  func testBadgeInteger() {
    let node = TextNode("Test").badge(5)
    XCTAssertEqual(node.attributes[.badge]?.int, 5)
  }

  func testBadgeZero() {
    let node = TextNode("Test").badge(0)
    XCTAssertEqual(node.attributes[.badge]?.int, 0)
  }

  func testBadgeChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .badge(42)
    .padding(20)

    XCTAssertEqual(node.attributes[.badge]?.int, 42)
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testBadgeWithTabItem() {
    let node = TextNode("Inbox")
      .tabItem("envelope", text: "Inbox")
      .badge(10)

    let tabItemDict = node.attributes[.tabItem]?.dict
    XCTAssertEqual(tabItemDict?[.systemName]?.string, "envelope")
    XCTAssertEqual(tabItemDict?[.text]?.string, "Inbox")
    XCTAssertEqual(node.attributes[.badge]?.int, 10)
  }
}
