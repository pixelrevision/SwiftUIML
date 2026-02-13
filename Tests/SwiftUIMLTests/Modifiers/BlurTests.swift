//
//  BlurTests.swift
//  SwiftUIML
//
//  Blur modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class BlurTests: XCTestCase {
  private let testColors = [
    "#FF3B30:#FF453A", "#FF9500:#FF9F0A", "#FFCC00:#FFD60A",
    "#34C759:#30D158", "#007AFF:#0A84FF", "#5856D6:#5E5CE6",
  ]

  @MainActor
  func testBlurVariations() {
    testNode(TestCase.modifier.blur.variations, size: CGSize(width: 300, height: 150)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("0")
            .font(size: 10)
        }
        .blur(0)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("2")
            .font(size: 10)
        }
        .blur(2)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("5")
            .font(size: 10)
        }
        .blur(5)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("10")
            .font(size: 10)
        }
        .blur(10)
      }
    }
  }

  @MainActor
  func testBlurOnImage() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.blur.onImage, size: CGSize(width: 250, height: 100)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 70, height: 70)
          TextNode("Sharp")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 70, height: 70)
            .blur(5)
          TextNode("Blurred")
            .font(size: 10)
        }
      }
    }
  }
}
