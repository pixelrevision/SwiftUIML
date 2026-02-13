//
//  PositionTests.swift
//  SwiftUIML
//
//  Position modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class PositionTests: XCTestCase {
  @MainActor
  func testPositionCenter() {
    testNode(TestCase.modifier.position.center, size: CGSize(width: 100, height: 100)) {
      ZStackNode(alignment: .topLeading) {
        ColorNode("#CCCCCC:#444444")
          .frame(width: 100, height: 100)

        ColorNode("#FF0000:#FF453A")
          .frame(width: 20, height: 20)
          .position(x: 50, y: 50)
      }
    }
  }

  @MainActor
  func testPositionTopLeft() {
    testNode(TestCase.modifier.position.topLeft, size: CGSize(width: 100, height: 100)) {
      ZStackNode(alignment: .topLeading) {
        ColorNode("#CCCCCC:#444444")
          .frame(width: 100, height: 100)

        ColorNode("#0000FF:#0A84FF")
          .frame(width: 20, height: 20)
          .position(x: 10, y: 10)
      }
    }
  }

  @MainActor
  func testPositionBottomRight() {
    testNode(TestCase.modifier.position.bottomRight, size: CGSize(width: 100, height: 100)) {
      ZStackNode(alignment: .topLeading) {
        ColorNode("#CCCCCC:#444444")
          .frame(width: 100, height: 100)

        ColorNode("#00FF00:#30D158")
          .frame(width: 20, height: 20)
          .position(x: 90, y: 90)
      }
    }
  }
}
