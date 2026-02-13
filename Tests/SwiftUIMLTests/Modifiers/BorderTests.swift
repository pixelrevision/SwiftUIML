//
//  BorderTests.swift
//  SwiftUIML
//
//  Border modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class BorderTests: XCTestCase {
  @MainActor
  func testBorderThin() {
    testNode(TestCase.modifier.border.thin, size: CGSize(width: 80, height: 40)) {
      TextNode("Border")
        .padding(8)
        .border("#007AFF:#0A84FF", width: 1)
    }
  }

  @MainActor
  func testBorderThick() {
    testNode(TestCase.modifier.border.thick, size: CGSize(width: 80, height: 40)) {
      TextNode("Border")
        .padding(8)
        .border("#34C759:#30D158", width: 4)
    }
  }

  @MainActor
  func testBorderColored() {
    testNode(TestCase.modifier.border.colored, size: CGSize(width: 80, height: 40)) {
      TextNode("Border")
        .padding(8)
        .border("#FF3B30:#FF9500", width: 2)
    }
  }
}
