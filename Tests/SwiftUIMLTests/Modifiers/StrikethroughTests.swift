//
//  StrikethroughTests.swift
//  SwiftUIML
//
//  Strikethrough modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class StrikethroughTests: XCTestCase {
  @MainActor
  func testStrikethroughBasic() {
    testNode(TestCase.modifier.strikethrough.basic, size: CGSize(width: 200, height: 100)) {
      VStackNode(spacing: 20) {
        TextNode("Simple strikethrough")
          .strikethrough()

        TextNode("No strikethrough")
      }
    }
  }

  @MainActor
  func testStrikethroughWithColor() {
    testNode(TestCase.modifier.strikethrough.withColor, size: CGSize(width: 200, height: 100)) {
      VStackNode(spacing: 20) {
        TextNode("Red strikethrough")
          .strikethrough(color: "#FF0000:#FF453A")

        TextNode("Blue strikethrough")
          .strikethrough(color: "#0000FF:#0A84FF")

        TextNode("Default strikethrough")
          .strikethrough()
      }
    }
  }

  @MainActor
  func testStrikethroughActive() {
    testNode(TestCase.modifier.strikethrough.active, size: CGSize(width: 200, height: 100)) {
      VStackNode(spacing: 20) {
        TextNode("Active strikethrough")
          .strikethrough(true)

        TextNode("Inactive strikethrough")
          .strikethrough(false)
      }
    }
  }
}
