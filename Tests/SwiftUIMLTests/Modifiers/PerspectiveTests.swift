//
//  PerspectiveTests.swift
//  SwiftUIML
//
//  Perspective modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class PerspectiveTests: XCTestCase {
  @MainActor
  func testPerspectiveVariations() {
    testNode(TestCase.modifier.perspective.variations, size: CGSize(width: 250, height: 150)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ColorNode("#34C759:#30D158")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 45, axis: (x: 0, y: 1, z: 0))
            .perspective(1.0)
          TextNode("1.0")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#34C759:#30D158")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 45, axis: (x: 0, y: 1, z: 0))
            .perspective(0.5)
          TextNode("0.5")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#34C759:#30D158")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 45, axis: (x: 0, y: 1, z: 0))
            .perspective(0.2)
          TextNode("0.2")
            .font(size: 10)
        }
      }
    }
  }

  @MainActor
  func testPerspectiveOnImage() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.perspective.onImage, size: CGSize(width: 200, height: 120)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 70, height: 70)
            .rotation3DEffect(degrees: 45, axis: (x: 0, y: 1, z: 0))
            .perspective(1.0)
          TextNode("1.0")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 70, height: 70)
            .rotation3DEffect(degrees: 45, axis: (x: 0, y: 1, z: 0))
            .perspective(0.3)
          TextNode("0.3")
            .font(size: 10)
        }
      }
    }
  }
}
