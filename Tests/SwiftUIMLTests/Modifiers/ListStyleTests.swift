//
//  ListStyleTests.swift
//  SwiftUIML
//
//  ListStyle modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ListStyleTests: XCTestCase {
  @MainActor
  func testListStyleVariations() {
    testNode(
      TestCase.modifier.listStyle.variations,
      size: CGSize(width: 350, height: 400),
      useHostingController: true
    ) {
      VStackNode(spacing: 20) {
        ListNode {
          TextNode("Item 1")
          TextNode("Item 2")
          TextNode("Item 3")
        }
        .listStyle(.plain)

        ListNode {
          TextNode("Item 1")
          TextNode("Item 2")
          TextNode("Item 3")
        }
        .listStyle(.insetGrouped)
      }
      .padding(20)
    }
  }
}
