import XCTest
@testable import SwiftUIMLCore

final class NodeTests: XCTestCase {
  func testAddingStableIdsToSingleNode() throws {
    let node = TextNode("Hello")
    let withIds = node.addingStableIds()

    XCTAssertEqual(withIds.id, "Text0")
  }
  
  func testAddingStableIdsPreservesExistingIds() throws {
    let node = TextNode("Hello")
      .id("custom-id")
    let withIds = node.addingStableIds()
    
    XCTAssertEqual(withIds.id, "custom-id")
  }
  
  func testAddingStableIdsToMultipleSiblings() throws {
    let node = VStackNode {
      TextNode("First")
      TextNode("Second")
      TextNode("Third")
    }

    let withIds = node.addingStableIds()

    // VStack should get ID
    XCTAssertEqual(withIds.id, "VStack0")

    // Children should get path-based IDs under VStack0
    XCTAssertEqual(withIds.children?[0].id, "VStack0.Text0")
    XCTAssertEqual(withIds.children?[1].id, "VStack0.Text1")
    XCTAssertEqual(withIds.children?[2].id, "VStack0.Text2")
  }
  
  func testAddingStableIdsToNestedStructure() throws {
    let node = VStackNode {
      TextNode("Title")
      HStackNode {
        TextNode("Left")
        TextNode("Right")
      }
      TextNode("Footer")
    }

    let withIds = node.addingStableIds()

    // VStack
    XCTAssertEqual(withIds.id, "VStack0")

    // First Text (child of VStack0)
    XCTAssertEqual(withIds.children?[0].id, "VStack0.Text0")

    // HStack (child of VStack0)
    let hstack = withIds.children?[1]
    XCTAssertEqual(hstack?.id, "VStack0.HStack0")

    // HStack children (children of VStack0.HStack0)
    XCTAssertEqual(hstack?.children?[0].id, "VStack0.HStack0.Text0")
    XCTAssertEqual(hstack?.children?[1].id, "VStack0.HStack0.Text1")

    // Last Text (second Text child of VStack0)
    XCTAssertEqual(withIds.children?[2].id, "VStack0.Text1")
  }
  
  func testAddingStableIdsMixedWithExplicitIds() throws {
    let node = VStackNode {
      TextNode("Auto ID")
      TextNode("Custom ID").id("my-text")
      TextNode("Another Auto")
    }

    let withIds = node.addingStableIds()

    XCTAssertEqual(withIds.id, "VStack0")
    XCTAssertEqual(withIds.children?[0].id, "VStack0.Text0")
    XCTAssertEqual(withIds.children?[1].id, "my-text")
    XCTAssertEqual(withIds.children?[2].id, "VStack0.Text1")
  }
  
  func testAddingStableIdsToDifferentViewTypes() throws {
    let node = VStackNode {
      TextNode("Text")
      ButtonNode("Button", onTap: "tap")
      ImageNode(systemName: "star")
      CircleNode()
    }

    let withIds = node.addingStableIds()

    XCTAssertEqual(withIds.id, "VStack0")
    XCTAssertEqual(withIds.children?[0].id, "VStack0.Text0")
    XCTAssertEqual(withIds.children?[1].id, "VStack0.Button0")
    XCTAssertEqual(withIds.children?[2].id, "VStack0.Image0")
    XCTAssertEqual(withIds.children?[3].id, "VStack0.Circle0")
  }
}
