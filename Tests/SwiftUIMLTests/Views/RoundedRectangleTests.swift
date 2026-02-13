//
//  RoundedRectangleTests.swift
//  SwiftUIML
//
//  RoundedRectangle view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class RoundedRectangleTests: XCTestCase {
  @MainActor
  func testRoundedRectangleFilled() {
    testNode(TestCase.view.roundedRectangle.filled, size: CGSize(width: 80, height: 60)) {
      RoundedRectangleNode(cornerRadius: 12)
        .foregroundColor("#007AFF:#0A84FF")
    }
  }

  @MainActor
  func testRoundedRectangleStroked() {
    testNode(TestCase.view.roundedRectangle.stroked, size: CGSize(width: 80, height: 60)) {
      RoundedRectangleNode(cornerRadius: 8)
        .stroke("#FF375F:#FF6482", lineWidth: 3)
    }
  }

  @MainActor
  func testRoundedRectangleSmallRadius() {
    testNode(TestCase.view.roundedRectangle.smallRadius, size: CGSize(width: 80, height: 60)) {
      RoundedRectangleNode(cornerRadius: 4)
        .foregroundColor("#34C759:#30D158")
    }
  }

  @MainActor
  func testRoundedRectangleLargeRadius() {
    testNode(TestCase.view.roundedRectangle.largeRadius, size: CGSize(width: 80, height: 60)) {
      RoundedRectangleNode(cornerRadius: 24)
        .foregroundColor("#FF9500:#FF9F0A")
    }
  }
}
