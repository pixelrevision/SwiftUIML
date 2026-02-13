//
//  MaskTests.swift
//  SwiftUIML
//
//  Mask modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class MaskTests: XCTestCase {
  @MainActor
  func testMaskCircle() {
    testNode(TestCase.modifier.mask.circle, size: CGSize(width: 120, height: 120)) {
      ColorNode("#007AFF:#0A84FF")
        .frame(width: 100, height: 100)
        .mask(
          CircleNode()
        )
    }
  }

  @MainActor
  func testMaskRoundedRectangle() {
    testNode(TestCase.modifier.mask.roundedRectangle, size: CGSize(width: 120, height: 120)) {
      LinearGradientNode(
        colors: ["#FF3B30:#FF453A", "#007AFF:#0A84FF"],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .frame(width: 100, height: 100)
      .mask(
        RoundedRectangleNode(cornerRadius: 20)
      )
    }
  }

  @MainActor
  func testMaskCapsule() {
    testNode(TestCase.modifier.mask.capsule, size: CGSize(width: 100, height: 80)) {
      LinearGradientNode(
        colors: ["#FF3B30:#FF453A", "#34C759:#30D158"],
        startPoint: .leading,
        endPoint: .trailing
      )
      .frame(width: 80, height: 60)
      .mask(
        CapsuleNode()
      )
    }
  }
}
