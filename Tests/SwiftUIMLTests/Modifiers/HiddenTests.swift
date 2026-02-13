//
//  HiddenTests.swift
//  SwiftUIML
//
//  Hidden modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class HiddenTests: XCTestCase {
  @MainActor
  func testHiddenBasic() {
    testNode(TestCase.modifier.hidden.basic, size: CGSize(width: 300, height: 200)) {
      VStackNode(spacing: 16) {
        TextNode("First Item")
          .font(.title2)
          .foregroundColor("#007AFF")

        TextNode("Hidden Item")
          .font(.title2)
          .foregroundColor("#FF3B30")
          .hidden()

        TextNode("Third Item")
          .font(.title2)
          .foregroundColor("#34C759")
      }
    }
  }

  @MainActor
  func testHiddenInStack() {
    testNode(TestCase.modifier.hidden.inStack, size: CGSize(width: 300, height: 150)) {
      HStackNode(spacing: 16) {
        ColorNode("#007AFF:#0A84FF")
          .frame(width: 60, height: 60)
          .cornerRadius(8)

        ColorNode("#FF3B30:#FF453A")
          .frame(width: 60, height: 60)
          .cornerRadius(8)
          .hidden()

        ColorNode("#34C759:#30D158")
          .frame(width: 60, height: 60)
          .cornerRadius(8)
      }
    }
  }

  @MainActor
  func testHiddenConditional() {
    testNode(TestCase.modifier.hidden.conditional, size: CGSize(width: 280, height: 250)) {
      VStackNode(spacing: 16) {
        TextNode("All Items Visible")
          .font(.headline)

        HStackNode(spacing: 12) {
          CircleNode()
            .fill("#FF9500")
            .frame(width: 40, height: 40)

          CircleNode()
            .fill("#FF9500")
            .frame(width: 40, height: 40)

          CircleNode()
            .fill("#FF9500")
            .frame(width: 40, height: 40)
        }

        DividerNode()

        TextNode("Middle Hidden")
          .font(.headline)

        HStackNode(spacing: 12) {
          CircleNode()
            .fill("#FF9500")
            .frame(width: 40, height: 40)

          CircleNode()
            .fill("#FF9500")
            .frame(width: 40, height: 40)
            .hidden()

          CircleNode()
            .fill("#FF9500")
            .frame(width: 40, height: 40)
        }
      }
    }
  }
}
