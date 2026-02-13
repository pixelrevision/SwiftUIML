//
//  GroupTests.swift
//  SwiftUIML
//
//  Group view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class GroupTests: XCTestCase {
  @MainActor
  func testGroupBasic() {
    testNode(TestCase.view.group.basic, size: CGSize(width: 200, height: 150)) {
      VStackNode {
        GroupNode {
          TextNode("Item 1")
          TextNode("Item 2")
          TextNode("Item 3")
        }
        .padding(10)
        .backgroundColor("#EEEEEE:#3C3C3E")
      }
    }
  }

  @MainActor
  func testGroupInList() {
    testNode(TestCase.view.group.inList, size: CGSize(width: 300, height: 250), useHostingController: true) {
      ListNode {
        GroupNode {
          TextNode("Item 1")
          TextNode("Item 2")
        }

        GroupNode {
          TextNode("Item 3")
          TextNode("Item 4")
        }
      }
    }
  }
}
