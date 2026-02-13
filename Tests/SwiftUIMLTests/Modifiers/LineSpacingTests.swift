//
//  LineSpacingTests.swift
//  SwiftUIML
//
//  LineSpacing modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LineSpacingTests: XCTestCase {
  @MainActor
  func testLineSpacingDifferentValues() {
    testNode(TestCase.modifier.lineSpacing.differentValues, size: CGSize(width: 130, height: 350)) {
      VStackNode(spacing: 20) {
        TextNode("Spacing 0\nSecond line\nThird line")
          .font(size: 14)
          .lineSpacing(0)

        TextNode("Spacing 5\nSecond line\nThird line")
          .font(size: 14)
          .lineSpacing(5)

        TextNode("Spacing 15\nSecond line\nThird line")
          .font(size: 14)
          .lineSpacing(15)
      }
    }
  }
}
