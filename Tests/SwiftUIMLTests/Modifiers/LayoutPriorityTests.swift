//
//  LayoutPriorityTests.swift
//  SwiftUIML
//
//  LayoutPriority modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LayoutPriorityTests: XCTestCase {
  @MainActor
  func testLayoutPriorityInHStack() {
    testNode(TestCase.modifier.layoutPriority.inHStack, size: CGSize(width: 320, height: 100)) {
      HStackNode(spacing: 10) {
        TextNode("Low Priority (0)")
          .font(size: 16)
          .padding(10)
          .backgroundColor("red")
          .layoutPriority(0)

        TextNode("High Priority (1)")
          .font(size: 16)
          .padding(10)
          .backgroundColor("green")
          .layoutPriority(1)

        TextNode("Normal Priority")
          .font(size: 16)
          .padding(10)
          .backgroundColor("blue")
      }
      .frame(width: 300)
    }
  }

  @MainActor
  func testLayoutPriorityComparison() {
    testNode(TestCase.modifier.layoutPriority.comparison, size: CGSize(width: 250, height: 200)) {
      VStackNode(spacing: 20) {
        // Without layout priority - equal distribution
        HStackNode(spacing: 5) {
          TextNode("Equal")
            .font(size: 14)
            .padding(8)
            .backgroundColor("gray")
          TextNode("Equal")
            .font(size: 14)
            .padding(8)
            .backgroundColor("gray")
          TextNode("Equal")
            .font(size: 14)
            .padding(8)
            .backgroundColor("gray")
        }
        .frame(width: 200)

        // With layout priority - priority 1 gets more space
        HStackNode(spacing: 5) {
          TextNode("Low")
            .font(size: 14)
            .padding(8)
            .backgroundColor("red")
            .layoutPriority(0)
          TextNode("High")
            .font(size: 14)
            .padding(8)
            .backgroundColor("green")
            .layoutPriority(1)
          TextNode("Low")
            .font(size: 14)
            .padding(8)
            .backgroundColor("red")
            .layoutPriority(0)
        }
        .frame(width: 200)
      }
    }
  }

  @MainActor
  func testLayoutPriorityTextTruncation() {
    testNode(TestCase.modifier.layoutPriority.textTruncation, size: CGSize(width: 320, height: 80)) {
      HStackNode(spacing: 10) {
        TextNode("This text has high priority and should not truncate")
          .font(size: 16)
          .layoutPriority(1)
          .foregroundColor("green")

        TextNode("This text has low priority and may truncate")
          .font(size: 16)
          .layoutPriority(0)
          .foregroundColor("red")
      }
      .frame(width: 300)
    }
  }
}
