//
//  RectangleTests.swift
//  SwiftUIML
//
//  Rectangle view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class RectangleTests: XCTestCase {
  @MainActor
  func testRectangleFilled() {
    testNode(TestCase.view.rectangle.filled, size: CGSize(width: 60, height: 40)) {
      RectangleNode()
        .foregroundColor("#007AFF:#0A84FF")
        .padding(5)
    }
  }

  @MainActor
  func testRectangleStroked() {
    testNode(TestCase.view.rectangle.stroked, size: CGSize(width: 60, height: 40)) {
      RectangleNode()
        .stroke("#FF375F:#FF6482", lineWidth: 4)
        .padding(5)
    }
  }

  @MainActor
  func testRectangleFilledAndStroked() {
    testNode(TestCase.view.rectangle.filledAndStroked, size: CGSize(width: 60, height: 40)) {
      ZStackNode {
        RectangleNode()
          .foregroundColor("#34C75980:#30D15880")
          .padding(5)
        RectangleNode()
          .stroke("#34C759:#30D158", lineWidth: 3)
          .padding(5)
      }
    }
  }
}
