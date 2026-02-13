//
//  LineLimitTests.swift
//  SwiftUIML
//
//  LineLimit modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LineLimitTests: XCTestCase {
  @MainActor
  func testLineLimitOne() {
    testNode(TestCase.modifier.lineLimit.one, size: CGSize(width: 140, height: 60)) {
      TextNode("This is a long text that should wrap to multiple lines")
        .lineLimit(1)
        .frame(width: 120, height: nil)
    }
  }

  @MainActor
  func testLineLimitTwo() {
    testNode(TestCase.modifier.lineLimit.two, size: CGSize(width: 140, height: 100)) {
      TextNode("This is a long text that should wrap to multiple lines")
        .lineLimit(2)
        .frame(width: 120, height: nil)
    }
  }

  @MainActor
  func testLineLimitThree() {
    testNode(TestCase.modifier.lineLimit.three, size: CGSize(width: 140, height: 120)) {
      TextNode("This is a long text that should wrap to multiple lines and show all content")
        .lineLimit(3)
        .frame(width: 120, height: nil)
    }
  }

  @MainActor
  func testLineLimitNone() {
    testNode(TestCase.modifier.lineLimit.none, size: CGSize(width: 140, height: 200)) {
      TextNode("This is a long text that should wrap to multiple lines and show all content without any truncation")
        .frame(width: 120, height: nil)
    }
  }
}
