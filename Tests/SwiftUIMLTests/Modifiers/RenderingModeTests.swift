//
//  RenderingModeTests.swift
//  SwiftUIML
//
//  RenderingMode modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class RenderingModeTests: XCTestCase {
  @MainActor
  func testRenderingModeComparison() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.renderingMode.original, size: CGSize(width: 300, height: 200)) {
      HStackNode(spacing: 32) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .renderingMode(.original)
            .frame(width: 80, height: 80)

          TextNode("Original")
            .font(.caption)
          TextNode("(Image Colors)")
            .font(.caption2)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .renderingMode(.template)
            .foregroundColor("#FF3B30")
            .frame(width: 80, height: 80)

          TextNode("Template")
            .font(.caption)
          TextNode("(Red Tint)")
            .font(.caption2)
        }
      }
    }
  }
}
