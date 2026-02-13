//
//  ColorInvertTests.swift
//  SwiftUIML
//
//  ColorInvert modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ColorInvertTests: XCTestCase {
  @MainActor
  func testColorInvertBasic() {
    testNode(TestCase.modifier.colorInvert.basic, size: CGSize(width: 240, height: 120)) {
      HStackNode(spacing: 20) {
        VStackNode(spacing: 8) {
          ColorNode("#FF3B30:#FF453A")
            .frame(width: 100, height: 100)
          TextNode("Original")
            .font(size: 12)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FF3B30:#FF453A")
            .frame(width: 100, height: 100)
            .colorInvert()
          TextNode("Inverted")
            .font(size: 12)
        }
      }
    }
  }

  @MainActor
  func testColorInvertOnImage() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.colorInvert.onImage, size: CGSize(width: 200, height: 100)) {
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
            .colorInvert()
          TextNode("Inverted")
            .font(size: 12)
        }
      }
    }
  }
}
