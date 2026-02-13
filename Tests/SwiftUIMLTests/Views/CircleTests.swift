//
//  CircleTests.swift
//  SwiftUIML
//
//  Circle view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class CircleTests: XCTestCase {
  @MainActor
  func testCircleFilled() {
    testNode(TestCase.view.circle.filled, size: CGSize(width: 60, height: 60)) {
      CircleNode()
        .foregroundColor("#007AFF:#0A84FF")
    }
  }

  @MainActor
  func testCircleStroked() {
    testNode(TestCase.view.circle.stroked, size: CGSize(width: 60, height: 60)) {
      CircleNode()
        .stroke("#FF375F:#FF6482", lineWidth: 4)
    }
  }

  @MainActor
  func testCircleFilledAndStroked() {
    testNode(TestCase.view.circle.filledAndStroked, size: CGSize(width: 60, height: 60)) {
      ZStackNode {
        CircleNode()
          .foregroundColor("#34C75980:#30D15880")
        CircleNode()
          .stroke("#34C759:#30D158", lineWidth: 3)
      }
    }
  }
}
