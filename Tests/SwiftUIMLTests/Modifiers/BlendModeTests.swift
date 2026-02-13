//
//  BlendModeTests.swift
//  SwiftUIML
//
//  BlendMode modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class BlendModeTests: XCTestCase {
  @MainActor
  func testBlendModeVariations() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.blendMode.variations, size: CGSize(width: 350, height: 200)) {
      VStackNode(spacing: 16) {
        HStackNode(spacing: 16) {
          VStackNode(spacing: 4) {
            ZStackNode {
              ColorNode("#FF3B30:#FF453A")
              ImageNode(name: "generated-image", bundle: bundleId)
                .resizable()
                .blendMode(.normal)
            }
            .frame(width: 70, height: 70)
            TextNode("Normal").font(size: 10)
          }

          VStackNode(spacing: 4) {
            ZStackNode {
              ColorNode("#FF3B30:#FF453A")
              ImageNode(name: "generated-image", bundle: bundleId)
                .resizable()
                .blendMode(.multiply)
            }
            .frame(width: 70, height: 70)
            TextNode("Multiply").font(size: 10)
          }

          VStackNode(spacing: 4) {
            ZStackNode {
              ColorNode("#FF3B30:#FF453A")
              ImageNode(name: "generated-image", bundle: bundleId)
                .resizable()
                .blendMode(.screen)
            }
            .frame(width: 70, height: 70)
            TextNode("Screen").font(size: 10)
          }
        }

        HStackNode(spacing: 16) {
          VStackNode(spacing: 4) {
            ZStackNode {
              ColorNode("#FF3B30:#FF453A")
              ImageNode(name: "generated-image", bundle: bundleId)
                .resizable()
                .blendMode(.overlay)
            }
            .frame(width: 70, height: 70)
            TextNode("Overlay").font(size: 10)
          }

          VStackNode(spacing: 4) {
            ZStackNode {
              ColorNode("#FF3B30:#FF453A")
              ImageNode(name: "generated-image", bundle: bundleId)
                .resizable()
                .blendMode(.darken)
            }
            .frame(width: 70, height: 70)
            TextNode("Darken").font(size: 10)
          }

          VStackNode(spacing: 4) {
            ZStackNode {
              ColorNode("#FF3B30:#FF453A")
              ImageNode(name: "generated-image", bundle: bundleId)
                .resizable()
                .blendMode(.lighten)
            }
            .frame(width: 70, height: 70)
            TextNode("Lighten").font(size: 10)
          }
        }
      }
      .padding(10)
    }
  }

  @MainActor
  func testBlendModeColorDodge() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.blendMode.colorDodge, size: CGSize(width: 170, height: 120)) {
      ZStackNode {
        LinearGradientNode(
          colors: ["#007AFF:#0A84FF", "#5856D6:#5E5CE6"]
        )
        .frame(width: 150, height: 100)

        ImageNode(name: "generated-image", bundle: bundleId)
          .resizable()
          .frame(width: 100, height: 100)
          .blendMode(.colorDodge)
      }
    }
  }
}
