//
//  VStackTests.swift
//  SwiftUIML
//
//  VStack view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class VStackTests: XCTestCase {
  @MainActor
  func testVStackBasicSpacing() {
    testNode(TestCase.view.vStack.basicSpacing, size: CGSize(width: 60, height: 150)) {
      VStackNode(spacing: 10) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testVStackAlignLeading() {
    testNode(TestCase.view.vStack.alignLeading, size: CGSize(width: 60, height: 150)) {
      VStackNode(spacing: 10, alignment: .leading) {
        ColorNode("#FF375F:#FF6482").frame(width: 20, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 40, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testVStackAlignCenter() {
    testNode(TestCase.view.vStack.alignCenter, size: CGSize(width: 60, height: 150)) {
      VStackNode(spacing: 10, alignment: .center) {
        ColorNode("#FF375F:#FF6482").frame(width: 20, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 40, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testVStackAlignTrailing() {
    testNode(TestCase.view.vStack.alignTrailing, size: CGSize(width: 60, height: 150)) {
      VStackNode(spacing: 10, alignment: .trailing) {
        ColorNode("#FF375F:#FF6482").frame(width: 20, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 40, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }
}
