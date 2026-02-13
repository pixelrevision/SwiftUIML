//
//  MultilineTextAlignmentTests.swift
//  SwiftUIML
//
//  MultilineTextAlignment modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class MultilineTextAlignmentTests: XCTestCase {
  @MainActor
  func testMultilineTextAlignmentLeading() {
    testNode(TestCase.modifier.multilineTextAlignment.leading, size: CGSize(width: 200, height: 80)) {
      TextNode("Short\nMedium Line\nVery Long Line Here")
        .multilineTextAlignment(.leading)
        .frame(width: 180, height: nil)
    }
  }

  @MainActor
  func testMultilineTextAlignmentCenter() {
    testNode(TestCase.modifier.multilineTextAlignment.center, size: CGSize(width: 200, height: 80)) {
      TextNode("Short\nMedium Line\nVery Long Line Here")
        .multilineTextAlignment(.center)
        .frame(width: 180, height: nil)
    }
  }

  @MainActor
  func testMultilineTextAlignmentTrailing() {
    testNode(TestCase.modifier.multilineTextAlignment.trailing, size: CGSize(width: 200, height: 80)) {
      TextNode("Short\nMedium Line\nVery Long Line Here")
        .multilineTextAlignment(.trailing)
        .frame(width: 180, height: nil)
    }
  }
}
