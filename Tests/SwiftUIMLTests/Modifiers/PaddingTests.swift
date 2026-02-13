//
//  PaddingTests.swift
//  SwiftUIML
//
//  Padding modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class PaddingTests: XCTestCase {
  @MainActor
  func testPaddingUniform() {
    testNode(TestCase.modifier.padding.uniform, size: CGSize(width: 100, height: 50)) {
      TextNode("text")
        .padding(16)
        .background(ColorNode("#007AFF:#0A84FF"))
    }
  }

  @MainActor
  func testPaddingEdgeSpecific() {
    testNode(TestCase.modifier.padding.edgeSpecific, size: CGSize(width: 100, height: 50)) {
      TextNode("text")
        .padding(top: 20, leading: 8, bottom: 4, trailing: 24)
        .background(ColorNode("#34C759:#30D158"))
    }
  }

  @MainActor
  func testPaddingNone() {
    testNode(TestCase.modifier.padding.none, size: CGSize(width: 100, height: 50)) {
      TextNode("text")
        .background(ColorNode("#FF375F:#FF453A"))
    }
  }
}
