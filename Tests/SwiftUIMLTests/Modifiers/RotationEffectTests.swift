//
//  RotationEffectTests.swift
//  SwiftUIML
//
//  RotationEffect modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class RotationEffectTests: XCTestCase {
  @MainActor
  func testRotationEffectVariations() {
    testNode(TestCase.modifier.rotationEffect.variations, size: CGSize(width: 350, height: 150)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ColorNode("#FF3B30:#FF453A")
            .frame(width: 60, height: 40)
            .rotationEffect(degrees: 0)
          TextNode("0°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FF3B30:#FF453A")
            .frame(width: 60, height: 40)
            .rotationEffect(degrees: 45)
          TextNode("45°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FF3B30:#FF453A")
            .frame(width: 60, height: 40)
            .rotationEffect(degrees: 90)
          TextNode("90°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FF3B30:#FF453A")
            .frame(width: 60, height: 40)
            .rotationEffect(degrees: 180)
          TextNode("180°")
            .font(size: 10)
        }
      }
    }
  }

  @MainActor
  func testRotationEffectOnImage() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.rotationEffect.onImage, size: CGSize(width: 200, height: 100)) {
      HStackNode(spacing: 20) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 70, height: 70)
          TextNode("0°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 70, height: 70)
            .rotationEffect(degrees: 45)
          TextNode("45°")
            .font(size: 10)
        }
      }
    }
  }
}
