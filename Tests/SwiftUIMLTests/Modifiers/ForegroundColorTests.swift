//
//  ForegroundColorTests.swift
//  SwiftUIML
//
//  ForegroundColor modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ForegroundColorTests: XCTestCase {
  @MainActor
  func testForegroundColorConditional() {
    testNode(TestCase.modifier.foregroundColor.conditional, size: CGSize(width: 50, height: 20)) {
      TextNode("hello")
        .foregroundColor("#FF0000:#0000FF")
    }
  }

  @MainActor
  func testForegroundColorNamed() {
    testNode(TestCase.modifier.foregroundColor.named, size: CGSize(width: 50, height: 20)) {
      TextNode("hello")
        .foregroundColor("orange")
    }
  }
}
