//
//  ItalicTests.swift
//  SwiftUIML
//
//  Italic modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ItalicTests: XCTestCase {
  @MainActor
  func testItalicText() {
    testNode(TestCase.modifier.italic.text, size: CGSize(width: 60, height: 30)) {
      TextNode("Italic")
        .italic()
    }
  }

  @MainActor
  func testItalicWithColor() {
    testNode(TestCase.modifier.italic.withColor, size: CGSize(width: 60, height: 30)) {
      TextNode("Italic")
        .italic()
        .foregroundColor("#007AFF:#0A84FF")
    }
  }
}
