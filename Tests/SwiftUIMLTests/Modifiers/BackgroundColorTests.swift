//
//  BackgroundColorTests.swift
//  SwiftUIML
//
//  BackgroundColor modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class BackgroundColorTests: XCTestCase {
  @MainActor
  func testBackgroundColorSolid() {
    testNode(TestCase.modifier.backgroundColor.solid, size: CGSize(width: 80, height: 50)) {
      TextNode("Hello")
        .padding(12)
        .backgroundColor("#007AFF:#0A84FF")
        .cornerRadius(8)
    }
  }

  @MainActor
  func testBackgroundColorSemiTransparent() {
    testNode(TestCase.modifier.backgroundColor.semiTransparent, size: CGSize(width: 120, height: 120)) {
      ZStackNode {
        ColorNode("#FF3B30:#FF453A")
          .frame(width: 100, height: 100)
        TextNode("Semi")
          .padding(12)
          .backgroundColor("#00000080:#FFFFFF80")
          .cornerRadius(8)
      }
    }
  }

  @MainActor
  func testBackgroundColorMultiple() {
    testNode(TestCase.modifier.backgroundColor.multiple, size: CGSize(width: 80, height: 130)) {
      VStackNode(spacing: 8) {
        TextNode("Red")
          .padding(8)
          .backgroundColor("#FF3B30:#FF453A")
        TextNode("Blue")
          .padding(8)
          .backgroundColor("#007AFF:#0A84FF")
        TextNode("Green")
          .padding(8)
          .backgroundColor("#34C759:#30D158")
      }
    }
  }
}
