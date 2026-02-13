//
//  OpacityTests.swift
//  SwiftUIML
//
//  Opacity modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class OpacityTests: XCTestCase {
  @MainActor
  func testOpacityFull() {
    testNode(TestCase.modifier.opacity.full, size: CGSize(width: 100, height: 40)) {
      TextNode("Opacity")
        .padding(8)
        .background(ColorNode("#007AFF:#0A84FF"))
        .opacity(1.0)
    }
  }

  @MainActor
  func testOpacityHalf() {
    testNode(TestCase.modifier.opacity.half, size: CGSize(width: 100, height: 40)) {
      TextNode("Opacity")
        .padding(8)
        .background(ColorNode("#007AFF:#0A84FF"))
        .opacity(0.5)
    }
  }

  @MainActor
  func testOpacityLow() {
    testNode(TestCase.modifier.opacity.low, size: CGSize(width: 100, height: 40)) {
      TextNode("Opacity")
        .padding(8)
        .background(ColorNode("#007AFF:#0A84FF"))
        .opacity(0.2)
    }
  }

  @MainActor
  func testOpacityZero() {
    testNode(TestCase.modifier.opacity.zero, size: CGSize(width: 100, height: 40), useHostingController: true) {
      TextNode("Opacity")
        .padding(8)
        .background(ColorNode("#007AFF:#0A84FF"))
        .opacity(0.0)
    }
  }
}
