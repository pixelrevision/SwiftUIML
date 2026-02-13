//
//  MinimumScaleFactorTests.swift
//  SwiftUIML
//
//  MinimumScaleFactor modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class MinimumScaleFactorTests: XCTestCase {
  @MainActor
  func testMinimumScaleFactorVariations() {
    testNode(TestCase.modifier.minimumScaleFactor.variations, size: CGSize(width: 200, height: 150)) {
      VStackNode(spacing: 20) {
        TextNode("This is a long text that should scale down to fit")
          .font(size: 30)
          .frame(width: 150)
          .lineLimit(1)
          .minimumScaleFactor(0.5)
          .border("red", width: 1)

        TextNode("This is a long text that should scale down more")
          .font(size: 30)
          .frame(width: 150)
          .lineLimit(1)
          .minimumScaleFactor(0.3)
          .border("blue", width: 1)

        TextNode("Short text")
          .font(size: 30)
          .frame(width: 150)
          .lineLimit(1)
          .minimumScaleFactor(0.5)
          .border("green", width: 1)
      }
    }
  }

  @MainActor
  func testMinimumScaleFactorDifferentValues() {
    testNode(TestCase.modifier.minimumScaleFactor.differentValues, size: CGSize(width: 200, height: 200)) {
      VStackNode(spacing: 16) {
        TextNode("Scale factor 1.0 (no scaling)")
          .font(size: 24)
          .frame(width: 120)
          .lineLimit(1)
          .minimumScaleFactor(1.0)
          .border("gray", width: 1)

        TextNode("Scale factor 0.8")
          .font(size: 24)
          .frame(width: 120)
          .lineLimit(1)
          .minimumScaleFactor(0.8)
          .border("gray", width: 1)

        TextNode("Scale factor 0.5")
          .font(size: 24)
          .frame(width: 120)
          .lineLimit(1)
          .minimumScaleFactor(0.5)
          .border("gray", width: 1)

        TextNode("Scale factor 0.2")
          .font(size: 24)
          .frame(width: 120)
          .lineLimit(1)
          .minimumScaleFactor(0.2)
          .border("gray", width: 1)
      }
    }
  }
}
