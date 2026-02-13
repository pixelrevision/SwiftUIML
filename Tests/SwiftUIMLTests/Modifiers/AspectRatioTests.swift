//
//  AspectRatioTests.swift
//  SwiftUIML
//
//  AspectRatio modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class AspectRatioTests: XCTestCase {
  @MainActor
  func testAspectRatioFit() {
    testNode(TestCase.modifier.aspectRatio.fit, size: CGSize(width: 120, height: 90)) {
      VStackNode(spacing: 4) {
        CircleNode()
          .fill("#FF0000:#FF453A")
          .aspectRatio(1.0, contentMode: .fit)
          .frame(width: 100, height: 60)
          .border("#CCCCCC:#666666", width: 1)
      }
    }
  }

  @MainActor
  func testAspectRatioFill() {
    testNode(TestCase.modifier.aspectRatio.fill, size: CGSize(width: 120, height: 120)) {
      VStackNode(spacing: 4) {
        RoundedRectangleNode(cornerRadius: 20)
          .fill("#0000FF33:#0A84FF33")
          .aspectRatio(1.0, contentMode: .fill)
          .frame(width: 100, height: 60)
          .border("#CCCCCC:#666666", width: 1)
      }
    }
  }

  @MainActor
  func testAspectRatioWide() {
    testNode(TestCase.modifier.aspectRatio.wide, size: CGSize(width: 100, height: 110)) {
      VStackNode(spacing: 4) {
        RectangleNode()
          .fill("#00AA00:#30D158")
          .aspectRatio(2.0, contentMode: .fit)
          .frame(width: 80, height: 80)
          .border("#CCCCCC:#666666", width: 1)
      }
    }
  }
}
