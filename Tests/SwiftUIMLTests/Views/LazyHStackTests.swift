//
//  LazyHStackTests.swift
//  SwiftUIML
//
//  LazyHStack view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LazyHStackTests: XCTestCase {
  @MainActor
  func testLazyHStackBasicSpacing() {
    testNode(TestCase.view.lazyHStack.basicSpacing, size: CGSize(width: 150, height: 60)) {
      LazyHStackNode(spacing: 10) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 30)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 30)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testLazyHStackAlignTop() {
    testNode(TestCase.view.lazyHStack.alignTop, size: CGSize(width: 150, height: 60)) {
      LazyHStackNode(spacing: 10, alignment: .top) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 20)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 40)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testLazyHStackAlignCenter() {
    testNode(TestCase.view.lazyHStack.alignCenter, size: CGSize(width: 150, height: 60)) {
      LazyHStackNode(spacing: 10, alignment: .center) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 20)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 40)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testLazyHStackAlignBottom() {
    testNode(TestCase.view.lazyHStack.alignBottom, size: CGSize(width: 150, height: 60)) {
      LazyHStackNode(spacing: 10, alignment: .bottom) {
        ColorNode("#FF375F:#FF6482").frame(width: 30, height: 20)
        ColorNode("#34C759:#30D158").frame(width: 30, height: 40)
        ColorNode("#007AFF:#0A84FF").frame(width: 30, height: 30)
      }
    }
  }
}
