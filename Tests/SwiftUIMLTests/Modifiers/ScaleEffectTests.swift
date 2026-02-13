//
//  ScaleEffectTests.swift
//  SwiftUIML
//
//  ScaleEffect modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ScaleEffectTests: XCTestCase {
  @MainActor
  func testScaleEffectVariations() {
    testNode(TestCase.modifier.scaleEffect.variations, size: CGSize(width: 400, height: 150)) {
      HStackNode(spacing: 24) {
        VStackNode(spacing: 8) {
          ColorNode("#007AFF:#0A84FF")
            .frame(width: 50, height: 50)
            .scaleEffect(0.5)
            .frame(width: 60, height: 60)
          TextNode("0.5x")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#007AFF:#0A84FF")
            .frame(width: 50, height: 50)
            .scaleEffect(1.0)
            .frame(width: 60, height: 60)
          TextNode("1.0x")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#007AFF:#0A84FF")
            .frame(width: 50, height: 50)
            .scaleEffect(1.5)
            .frame(width: 80, height: 80)
          TextNode("1.5x")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#007AFF:#0A84FF")
            .frame(width: 50, height: 50)
            .scaleEffect(2.0)
            .frame(width: 110, height: 110)
          TextNode("2.0x")
            .font(size: 10)
        }
      }
    }
  }

  @MainActor
  func testScaleEffectNonUniform() {
    testNode(TestCase.modifier.scaleEffect.nonUniform, size: CGSize(width: 320, height: 160)) {
      HStackNode(spacing: 24) {
        VStackNode(spacing: 8) {
          ColorNode("#34C759:#30D158")
            .frame(width: 50, height: 50)
            .frame(width: 60, height: 60)
          TextNode("Original")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#34C759:#30D158")
            .frame(width: 50, height: 50)
            .scaleEffect(x: 2.0, y: 1.0)
            .frame(width: 110, height: 60)
          TextNode("Wide")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#34C759:#30D158")
            .frame(width: 50, height: 50)
            .scaleEffect(x: 1.0, y: 2.0)
            .frame(width: 60, height: 110)
          TextNode("Tall")
            .font(size: 10)
        }
      }
    }
  }
}
