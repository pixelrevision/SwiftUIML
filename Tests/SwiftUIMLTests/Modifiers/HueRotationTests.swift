//
//  HueRotationTests.swift
//  SwiftUIML
//
//  HueRotation modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class HueRotationTests: XCTestCase {
  private let testColors = [
    "#FF3B30:#FF453A", "#FF9500:#FF9F0A", "#FFCC00:#FFD60A",
    "#34C759:#30D158", "#007AFF:#0A84FF", "#5856D6:#5E5CE6",
  ]

  @MainActor
  func testHueRotationVariations() {
    testNode(TestCase.modifier.hueRotation.variations, size: CGSize(width: 300, height: 150)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("0°")
            .font(size: 10)
        }
        .hueRotation(0)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("90°")
            .font(size: 10)
        }
        .hueRotation(90)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("180°")
            .font(size: 10)
        }
        .hueRotation(180)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("270°")
            .font(size: 10)
        }
        .hueRotation(270)
      }
    }
  }

  @MainActor
  func testHueRotationOnImage() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.hueRotation.onImage, size: CGSize(width: 220, height: 100)) {
      HStackNode(spacing: 20) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 80, height: 80)
          TextNode("Original")
            .font(size: 12)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 80, height: 80)
            .hueRotation(180)
          TextNode("180° Rotated")
            .font(size: 12)
        }
      }
    }
  }
}
