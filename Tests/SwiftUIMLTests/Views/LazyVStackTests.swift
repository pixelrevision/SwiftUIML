//
//  LazyVStackTests.swift
//  SwiftUIML
//
//  LazyVStack view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LazyVStackTests: XCTestCase {
  @MainActor
  func testLazyVStackBasicSpacing() {
    testNode(TestCase.view.lazyVStack.basicSpacing, size: CGSize(width: 60, height: 150)) {
      LazyVStackNode(spacing: 10) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testLazyVStackAlignLeading() {
    testNode(TestCase.view.lazyVStack.alignLeading, size: CGSize(width: 60, height: 150)) {
      LazyVStackNode(spacing: 10, alignment: .leading) {
        ColorNode("#FF375F:#FF6482").frame(width: 20, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 40, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testLazyVStackAlignCenter() {
    testNode(TestCase.view.lazyVStack.alignCenter, size: CGSize(width: 60, height: 150)) {
      LazyVStackNode(spacing: 10, alignment: .center) {
        ColorNode("#FF375F:#FF6482").frame(width: 20, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 40, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testLazyVStackAlignTrailing() {
    testNode(TestCase.view.lazyVStack.alignTrailing, size: CGSize(width: 60, height: 150)) {
      LazyVStackNode(spacing: 10, alignment: .trailing) {
        ColorNode("#FF375F:#FF6482").frame(width: 20, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 40, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }
}
