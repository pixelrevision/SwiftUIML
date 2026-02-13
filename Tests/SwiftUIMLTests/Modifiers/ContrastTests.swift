//
//  ContrastTests.swift
//  SwiftUIML
//
//  Contrast modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ContrastTests: XCTestCase {
  private let testColors = [
    "#FF3B30:#FF453A", "#FF9500:#FF9F0A", "#FFCC00:#FFD60A",
    "#34C759:#30D158", "#007AFF:#0A84FF", "#5856D6:#5E5CE6",
  ]

  @MainActor
  func testContrastVariations() {
    testNode(TestCase.modifier.contrast.variations, size: CGSize(width: 300, height: 150)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("0.0")
            .font(size: 10)
        }
        .contrast(0.0)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("0.5")
            .font(size: 10)
        }
        .contrast(0.5)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("1.0")
            .font(size: 10)
        }
        .contrast(1.0)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("2.0")
            .font(size: 10)
        }
        .contrast(2.0)
      }
    }
  }

  @MainActor
  func testContrastOnImage() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.contrast.onImage, size: CGSize(width: 200, height: 100)) {
      HStackNode(spacing: 20) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 80, height: 80)
            .contrast(0.5)
          TextNode("Low")
            .font(size: 12)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 80, height: 80)
            .contrast(2.0)
          TextNode("High")
            .font(size: 12)
        }
      }
    }
  }
}
