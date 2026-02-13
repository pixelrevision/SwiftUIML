//
//  ColorMultiplyTests.swift
//  SwiftUIML
//
//  ColorMultiply modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ColorMultiplyTests: XCTestCase {
  @MainActor
  func testColorMultiplyVariations() {
    testNode(TestCase.modifier.colorMultiply.variations, size: CGSize(width: 350, height: 125)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ColorNode("#FFFFFF")
            .frame(width: 60, height: 60)
          TextNode("Original")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FFFFFF")
            .frame(width: 60, height: 60)
            .colorMultiply("#FF3B30:#FF453A")
          TextNode("Red")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FFFFFF")
            .frame(width: 60, height: 60)
            .colorMultiply("#34C759:#30D158")
          TextNode("Green")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FFFFFF")
            .frame(width: 60, height: 60)
            .colorMultiply("#007AFF:#0A84FF")
          TextNode("Blue")
            .font(size: 10)
        }
      }
    }
  }

  @MainActor
  func testColorMultiplyOnImage() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.colorMultiply.onImage, size: CGSize(width: 200, height: 100)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 80, height: 80)
          TextNode("Original")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 80, height: 80)
            .colorMultiply("#FF3B30:#FF453A")
          TextNode("Multiplied")
            .font(size: 10)
        }
      }
    }
  }
}
