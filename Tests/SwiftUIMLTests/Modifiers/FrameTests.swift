//
//  FrameTests.swift
//  SwiftUIML
//
//  Frame modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class FrameTests: XCTestCase {
  @MainActor
  func testFrameFixedWidthHeight() {
    testNode(TestCase.modifier.frame.fixedWidthHeight, size: CGSize(width: 120, height: 70)) {
      TextNode("test")
        .frame(width: 100, height: 50)
        .background(ColorNode("#007AFF:#0A84FF"))
    }
  }

  @MainActor
  func testFrameWidthOnly() {
    testNode(TestCase.modifier.frame.widthOnly, size: CGSize(width: 100, height: 50)) {
      TextNode("test")
        .frame(width: 80, height: nil)
        .background(ColorNode("#34C759:#30D158"))
    }
  }

  @MainActor
  func testFrameHeightOnly() {
    testNode(TestCase.modifier.frame.heightOnly, size: CGSize(width: 100, height: 80)) {
      TextNode("test")
        .frame(width: nil, height: 60)
        .background(ColorNode("#FF9500:#FF9F0A"))
    }
  }

  @MainActor
  func testFrameMaxWidthInfinity() {
    testNode(TestCase.modifier.frame.maxWidthInfinity, size: CGSize(width: 120, height: 40)) {
      TextNode("test")
        .frame(maxWidth: .infinity)
        .background(ColorNode("#FF3B30:#FF453A"))
    }
  }

  @MainActor
  func testFrameMaxHeightInfinity() {
    testNode(TestCase.modifier.frame.maxHeightInfinity, size: CGSize(width: 100, height: 80)) {
      TextNode("test")
        .frame(maxHeight: .infinity)
        .background(ColorNode("#5856D6:#5E5CE6"))
    }
  }

  @MainActor
  func testFrameMultipleModifiers() {
    testNode(TestCase.modifier.frame.multipleModifiers, size: CGSize(width: 150, height: 60)) {
      ColorNode("#FF2D55:#FF375F")
        .frame(maxWidth: 100)
        .frame(height: 40)
    }
  }

  @MainActor
  func testFrameChainedConstraints() {
    testNode(TestCase.modifier.frame.chainedConstraints, size: CGSize(width: 160, height: 70)) {
      ColorNode("#5AC8FA:#64D2FF")
        .frame(width: 80)
        .frame(minHeight: 30, maxHeight: 50)
    }
  }
}
