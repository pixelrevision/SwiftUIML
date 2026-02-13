//
//  BoldTests.swift
//  SwiftUIML
//
//  Bold modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class BoldTests: XCTestCase {
  @MainActor
  func testBoldText() {
    testNode(TestCase.modifier.bold.text, size: CGSize(width: 60, height: 30)) {
      TextNode("Bold")
        .bold()
    }
  }

  @MainActor
  func testBoldWithColor() {
    testNode(TestCase.modifier.bold.withColor, size: CGSize(width: 60, height: 30)) {
      TextNode("Bold")
        .bold()
        .foregroundColor("#007AFF:#0A84FF")
    }
  }
}
