//
//  BackgroundTests.swift
//  SwiftUIML
//
//  Background modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class BackgroundTests: XCTestCase {
  @MainActor
  func testBackgroundColor() {
    testNode(TestCase.modifier.background.color, size: CGSize(width: 100, height: 50)) {
      TextNode("test")
        .padding(12)
        .background(ColorNode("#007AFF:#0A84FF"))
    }
  }

  @MainActor
  func testBackgroundGradient() {
    testNode(TestCase.modifier.background.gradient, size: CGSize(width: 100, height: 50)) {
      TextNode("test")
        .padding(12)
        .background(
          LinearGradientNode(
            colors: ["#007AFF:#0A84FF", "#34C759:#30D158"],
            startPoint: .top,
            endPoint: .bottom
          )
        )
    }
  }

  @MainActor
  func testBackgroundAligned() {
    testNode(TestCase.modifier.background.aligned, size: CGSize(width: 100, height: 60)) {
      TextNode("test")
        .padding(12)
        .background(
          CircleNode()
            .fill("#FF3B3033:#FF453A33")
            .frame(width: 40, height: 40),
          alignment: .topLeading
        )
    }
  }
}
