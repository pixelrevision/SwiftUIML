//
//  OffsetTests.swift
//  SwiftUIML
//
//  Offset modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class OffsetTests: XCTestCase {
  @MainActor
  func testOffsetX() {
    testNode(TestCase.modifier.offset.x, size: CGSize(width: 100, height: 100)) {
      ZStackNode(alignment: .topLeading) {
        ColorNode("#CCCCCC:#444444")
          .frame(width: 50, height: 50)

        ColorNode("#FF0000:#FF453A")
          .frame(width: 50, height: 50)
          .offset(x: 30)
      }
    }
  }

  @MainActor
  func testOffsetY() {
    testNode(TestCase.modifier.offset.y, size: CGSize(width: 100, height: 100)) {
      ZStackNode(alignment: .topLeading) {
        ColorNode("#CCCCCC:#444444")
          .frame(width: 50, height: 50)

        ColorNode("#0000FF:#0A84FF")
          .frame(width: 50, height: 50)
          .offset(y: 30)
      }
    }
  }

  @MainActor
  func testOffsetXY() {
    testNode(TestCase.modifier.offset.xy, size: CGSize(width: 100, height: 100)) {
      ZStackNode(alignment: .topLeading) {
        ColorNode("#CCCCCC:#444444")
          .frame(width: 50, height: 50)

        ColorNode("#00FF00:#30D158")
          .frame(width: 50, height: 50)
          .offset(x: 25, y: 25)
      }
    }
  }
}
