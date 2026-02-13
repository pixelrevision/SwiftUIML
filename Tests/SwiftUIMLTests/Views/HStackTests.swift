//
//  HStackTests.swift
//  SwiftUIML
//
//  HStack view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class HStackTests: XCTestCase {
  @MainActor
  func testHStackBasicSpacing() {
    testNode(TestCase.view.hStack.basicSpacing, size: CGSize(width: 150, height: 60)) {
      HStackNode(spacing: 10) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testHStackAlignTop() {
    testNode(TestCase.view.hStack.alignTop, size: CGSize(width: 150, height: 60)) {
      HStackNode(spacing: 10, alignment: .top) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 20)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 40)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testHStackAlignCenter() {
    testNode(TestCase.view.hStack.alignCenter, size: CGSize(width: 150, height: 60)) {
      HStackNode(spacing: 10, alignment: .center) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 20)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 40)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testHStackAlignBottom() {
    testNode(TestCase.view.hStack.alignBottom, size: CGSize(width: 150, height: 60)) {
      HStackNode(spacing: 10, alignment: .bottom) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 20)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 40)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }
}
