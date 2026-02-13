//
//  GrayscaleTests.swift
//  SwiftUIML
//
//  Grayscale modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class GrayscaleTests: XCTestCase {
  private let testColors = [
    "#FF3B30:#FF453A", "#FF9500:#FF9F0A", "#FFCC00:#FFD60A",
    "#34C759:#30D158", "#007AFF:#0A84FF", "#5856D6:#5E5CE6",
  ]

  @MainActor
  func testGrayscaleVariations() {
    testNode(TestCase.modifier.grayscale.variations, size: CGSize(width: 300, height: 150)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("0.0")
            .font(size: 10)
        }
        .grayscale(0.0)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("0.25")
            .font(size: 10)
        }
        .grayscale(0.25)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("0.5")
            .font(size: 10)
        }
        .grayscale(0.5)

        VStackNode(spacing: 8) {
          LinearGradientNode(colors: self.testColors)
            .frame(width: 60, height: 100)
          TextNode("1.0")
            .font(size: 10)
        }
        .grayscale(1.0)
      }
    }
  }

  @MainActor
  func testGrayscaleOnImage() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.grayscale.onImage, size: CGSize(width: 200, height: 100)) {
      HStackNode(spacing: 20) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 80, height: 80)
          TextNode("Color")
            .font(size: 12)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 80, height: 80)
            .grayscale(1.0)
          TextNode("Grayscale")
            .font(size: 12)
        }
      }
    }
  }
}
