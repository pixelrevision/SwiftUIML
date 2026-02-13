//
//  BaselineOffsetTests.swift
//  SwiftUIML
//
//  BaselineOffset modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class BaselineOffsetTests: XCTestCase {
  @MainActor
  func testBaselineOffsetDifferentValues() {
    testNode(TestCase.modifier.baselineOffset.differentValues, size: CGSize(width: 250, height: 150)) {
      VStackNode(spacing: 20) {
        HStackNode(spacing: 5, alignment: .bottom) {
          TextNode("Base")
            .font(size: 20)
          TextNode("+5")
            .font(size: 20)
            .baselineOffset(5)
            .foregroundColor("green")
          TextNode("+10")
            .font(size: 20)
            .baselineOffset(10)
            .foregroundColor("green")
          TextNode("+15")
            .font(size: 20)
            .baselineOffset(15)
            .foregroundColor("green")
        }

        HStackNode(spacing: 5, alignment: .top) {
          TextNode("Base")
            .font(size: 20)
          TextNode("-5")
            .font(size: 20)
            .baselineOffset(-5)
            .foregroundColor("red")
          TextNode("-10")
            .font(size: 20)
            .baselineOffset(-10)
            .foregroundColor("red")
          TextNode("-15")
            .font(size: 20)
            .baselineOffset(-15)
            .foregroundColor("red")
        }
      }
    }
  }

  @MainActor
  func testBaselineOffsetSubscriptSuperscript() {
    testNode(TestCase.modifier.baselineOffset.subscriptSuperscript, size: CGSize(width: 200, height: 150)) {
      VStackNode(spacing: 20) {
        HStackNode(spacing: 2, alignment: .bottom) {
          TextNode("H")
            .font(size: 32)
          TextNode("2")
            .font(size: 20)
            .baselineOffset(-8)
          TextNode("O")
            .font(size: 32)
        }

        HStackNode(spacing: 2, alignment: .bottom) {
          TextNode("E")
            .font(size: 32)
          TextNode("=")
            .font(size: 32)
          TextNode("mc")
            .font(size: 32)
          TextNode("2")
            .font(size: 20)
            .baselineOffset(8)
        }
      }
    }
  }
}
