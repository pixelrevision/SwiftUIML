//
//  ZStackTests.swift
//  SwiftUIML
//
//  ZStack view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ZStackTests: XCTestCase {
  @MainActor
  func testZStackBasicLayering() {
    testNode(TestCase.view.zStack.basicLayering, size: CGSize(width: 100, height: 100)) {
      ZStackNode {
        CircleNode()
          .foregroundColor("#FF375F80:#FF648280")
          .frame(width: 60, height: 60)
        CircleNode()
          .foregroundColor("#34C75980:#30D15880")
          .frame(width: 45, height: 45)
        CircleNode()
          .foregroundColor("#007AFF80:#0A84FF80")
          .frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testZStackAlignTopLeading() {
    testNode(TestCase.view.zStack.alignTopLeading, size: CGSize(width: 100, height: 100)) {
      ZStackNode(alignment: .topLeading) {
        CircleNode()
          .foregroundColor("#FF375F80:#FF648280")
          .frame(width: 60, height: 60)
        CircleNode()
          .foregroundColor("#34C75980:#30D15880")
          .frame(width: 45, height: 45)
        CircleNode()
          .foregroundColor("#007AFF80:#0A84FF80")
          .frame(width: 30, height: 30)
      }
    }
  }

  @MainActor
  func testZStackAlignBottomTrailing() {
    testNode(TestCase.view.zStack.alignBottomTrailing, size: CGSize(width: 100, height: 100)) {
      ZStackNode(alignment: .bottomTrailing) {
        CircleNode()
          .foregroundColor("#FF375F80:#FF648280")
          .frame(width: 60, height: 60)
        CircleNode()
          .foregroundColor("#34C75980:#30D15880")
          .frame(width: 45, height: 45)
        CircleNode()
          .foregroundColor("#007AFF80:#0A84FF80")
          .frame(width: 30, height: 30)
      }
    }
  }
}
