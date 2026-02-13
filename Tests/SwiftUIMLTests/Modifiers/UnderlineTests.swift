//
//  UnderlineTests.swift
//  SwiftUIML
//
//  Underline modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class UnderlineTests: XCTestCase {
  @MainActor
  func testUnderlineBasic() {
    testNode(TestCase.modifier.underline.basic, size: CGSize(width: 200, height: 100)) {
      VStackNode(spacing: 20) {
        TextNode("Simple underline")
          .underline()

        TextNode("No underline")
      }
    }
  }

  @MainActor
  func testUnderlineWithColor() {
    testNode(TestCase.modifier.underline.withColor, size: CGSize(width: 200, height: 100)) {
      VStackNode(spacing: 20) {
        TextNode("Red underline")
          .underline(color: "#FF0000:#FF453A")

        TextNode("Blue underline")
          .underline(color: "#0000FF:#0A84FF")

        TextNode("Default underline")
          .underline()
      }
    }
  }

  @MainActor
  func testUnderlineActive() {
    testNode(TestCase.modifier.underline.active, size: CGSize(width: 200, height: 100)) {
      VStackNode(spacing: 20) {
        TextNode("Active underline")
          .underline(true)

        TextNode("Inactive underline")
          .underline(false)
      }
    }
  }
}
