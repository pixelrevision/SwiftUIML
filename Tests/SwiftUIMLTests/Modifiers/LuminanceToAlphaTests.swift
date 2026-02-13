//
//  LuminanceToAlphaTests.swift
//  SwiftUIML
//
//  LuminanceToAlpha modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LuminanceToAlphaTests: XCTestCase {
  @MainActor
  func testLuminanceToAlphaBasic() {
    testNode(TestCase.modifier.luminanceToAlpha.basic, size: CGSize(width: 300, height: 200)) {
      HStackNode(spacing: 20) {
        ZStackNode {
          ColorNode("#FF3B30:#FF453A").frame(width: 100, height: 150)

          VStackNode(spacing: 4) {
            TextNode("Light")
              .foregroundColor("#FFFFFF")
              .font(size: 20)
              .bold()
            TextNode("Dark")
              .foregroundColor("#000000")
              .font(size: 20)
              .bold()
          }
        }

        ZStackNode {
          ColorNode("#FF3B30:#FF453A").frame(width: 100, height: 150)

          VStackNode(spacing: 4) {
            TextNode("Light")
              .foregroundColor("#FFFFFF")
              .font(size: 20)
              .bold()
            TextNode("Dark")
              .foregroundColor("#000000")
              .font(size: 20)
              .bold()
          }
          .luminanceToAlpha()
        }
      }
    }
  }

  @MainActor
  func testLuminanceToAlphaOnImage() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.luminanceToAlpha.onImage, size: CGSize(width: 200, height: 100)) {
      HStackNode(spacing: 20) {
        ZStackNode {
          ColorNode("#007AFF:#0A84FF").frame(width: 80, height: 80)
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 70, height: 70)
        }

        ZStackNode {
          ColorNode("#007AFF:#0A84FF").frame(width: 80, height: 80)
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 70, height: 70)
            .luminanceToAlpha()
        }
      }
    }
  }
}
