//
//  TrackingTests.swift
//  SwiftUIML
//
//  Tracking modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class TrackingTests: XCTestCase {
  @MainActor
  func testTrackingVariations() {
    testNode(TestCase.modifier.tracking.variations, size: CGSize(width: 200, height: 150)) {
      VStackNode(spacing: 20) {
        TextNode("Normal tracking")
          .font(size: 20)

        TextNode("Tight tracking")
          .font(size: 20)
          .tracking(-2)

        TextNode("Loose tracking")
          .font(size: 20)
          .tracking(5)
      }
    }
  }

  @MainActor
  func testTrackingDifferentValues() {
    testNode(TestCase.modifier.tracking.differentValues, size: CGSize(width: 200, height: 150)) {
      VStackNode(spacing: 16) {
        TextNode("Tracking -4")
          .font(size: 18)
          .tracking(-4)

        TextNode("Tracking 0")
          .font(size: 18)
          .tracking(0)

        TextNode("Tracking 3")
          .font(size: 18)
          .tracking(3)

        TextNode("Tracking 10")
          .font(size: 18)
          .tracking(10)
      }
    }
  }
}
