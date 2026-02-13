//
//  FixedSizeTests.swift
//  SwiftUIML
//
//  FixedSize modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class FixedSizeTests: XCTestCase {
  @MainActor
  func testFixedSizeBothAxes() {
    testNode(TestCase.modifier.fixedSize.bothAxes, size: CGSize(width: 220, height: 80)) {
      HStackNode(spacing: 10) {
        VStackNode {
          TextNode("Wrapped")
          TextNode("Text wraps here")
            .frame(width: 60)
            .padding(4)
            .border("#FF0000:#FF453A", width: 1)
        }

        VStackNode {
          TextNode("Fixed")
          TextNode("Text wraps here")
            .fixedSize()
            .padding(4)
            .border("#00FF00:#30D158", width: 1)
        }
      }
    }
  }

  @MainActor
  func testFixedSizeHorizontalOnly() {
    testNode(TestCase.modifier.fixedSize.horizontalOnly, size: CGSize(width: 200, height: 160)) {
      VStackNode(spacing: 8) {
        TextNode("Without fixedSize:")
        HStackNode {
          ColorNode("#FF0000:#FF453A")
            .frame(width: 50, height: 40)
          TextNode("Wraps")
        }
        .frame(width: 80)
        .border("#FF0000:#FF453A", width: 1)

        TextNode("With fixedSize:")
        HStackNode {
          ColorNode("#00FF00:#30D158")
            .frame(width: 50, height: 40)
          TextNode("Wraps")
        }
        .fixedSize(horizontal: true, vertical: false)
        .border("#00FF00:#30D158", width: 1)
      }
    }
  }

  @MainActor
  func testFixedSizeVerticalOnly() {
    testNode(TestCase.modifier.fixedSize.verticalOnly, size: CGSize(width: 140, height: 100)) {
      HStackNode(spacing: 10) {
        VStackNode {
          TextNode("Compressed")
          ColorNode("#FF0000:#FF453A")
            .frame(width: 40, height: 60)
            .frame(height: 30)
            .border("#FF0000:#FF453A", width: 1)
        }

        VStackNode {
          TextNode("Fixed")
          ColorNode("#00FF00:#30D158")
            .frame(width: 40, height: 60)
            .fixedSize(horizontal: false, vertical: true)
            .border("#00FF00:#30D158", width: 1)
        }
      }
    }
  }
}
