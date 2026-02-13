//
//  UnevenRoundedRectangleTests.swift
//  SwiftUIML
//
//  UnevenRoundedRectangle view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class UnevenRoundedRectangleTests: XCTestCase {
  @MainActor
  func testFilledUnevenRoundedRectangle() {
    testNode(TestCase.view.unevenRoundedRectangle.filled, size: CGSize(width: 100, height: 60)) {
      UnevenRoundedRectangleNode(
        topLeading: 30,
        bottomLeading: 10,
        bottomTrailing: 30,
        topTrailing: 10
      )
      .foregroundColor("#007AFF")
    }
  }

  @MainActor
  func testStrokedUnevenRoundedRectangle() {
    testNode(TestCase.view.unevenRoundedRectangle.stroked, size: CGSize(width: 100, height: 60)) {
      UnevenRoundedRectangleNode(
        topLeading: 30,
        bottomLeading: 10,
        bottomTrailing: 30,
        topTrailing: 10
      )
      .stroke("#FF375F", lineWidth: 3)
    }
  }

  @MainActor
  func testAllCornersRounded() {
    testNode(TestCase.view.unevenRoundedRectangle.allCorners, size: CGSize(width: 80, height: 60)) {
      UnevenRoundedRectangleNode(
        topLeading: 20,
        bottomLeading: 20,
        bottomTrailing: 20,
        topTrailing: 20
      )
      .foregroundColor("#34C759")
    }
  }

  @MainActor
  func testSingleCornerRounded() {
    testNode(TestCase.view.unevenRoundedRectangle.singleCorner, size: CGSize(width: 80, height: 60)) {
      UnevenRoundedRectangleNode(
        topLeading: 30,
        bottomLeading: 0,
        bottomTrailing: 0,
        topTrailing: 0
      )
      .foregroundColor("#FF9500")
    }
  }
}
