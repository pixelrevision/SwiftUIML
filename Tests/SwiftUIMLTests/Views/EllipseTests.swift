//
//  EllipseTests.swift
//  SwiftUIML
//
//  Ellipse view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class EllipseTests: XCTestCase {
  @MainActor
  func testEllipseFilled() {
    testNode(TestCase.view.ellipse.filled, size: CGSize(width: 60, height: 40)) {
      EllipseNode()
        .foregroundColor("#007AFF:#0A84FF")
    }
  }

  @MainActor
  func testEllipseStroked() {
    testNode(TestCase.view.ellipse.stroked, size: CGSize(width: 60, height: 40)) {
      EllipseNode()
        .stroke("#FF375F:#FF6482", lineWidth: 4)
    }
  }

  @MainActor
  func testEllipseFilledAndStroked() {
    testNode(TestCase.view.ellipse.filledAndStroked, size: CGSize(width: 60, height: 40)) {
      ZStackNode {
        EllipseNode()
          .foregroundColor("#34C75980:#30D15880")
        EllipseNode()
          .stroke("#34C759:#30D158", lineWidth: 3)
      }
    }
  }
}
