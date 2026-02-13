//
//  Rotation3DEffectTests.swift
//  SwiftUIML
//
//  Rotation3DEffect modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class Rotation3DEffectTests: XCTestCase {
  @MainActor
  func testRotation3DEffectXAxis() {
    testNode(TestCase.modifier.rotation3DEffect.xAxis, size: CGSize(width: 350, height: 150)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ColorNode("#5856D6:#5E5CE6")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 0, axis: (x: 1, y: 0, z: 0))
          TextNode("0°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#5856D6:#5E5CE6")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 30, axis: (x: 1, y: 0, z: 0))
          TextNode("30°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#5856D6:#5E5CE6")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 60, axis: (x: 1, y: 0, z: 0))
          TextNode("60°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#5856D6:#5E5CE6")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 90, axis: (x: 1, y: 0, z: 0))
          TextNode("90°")
            .font(size: 10)
        }
      }
    }
  }

  @MainActor
  func testRotation3DEffectYAxis() {
    testNode(TestCase.modifier.rotation3DEffect.yAxis, size: CGSize(width: 350, height: 150)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ColorNode("#FF9500:#FF9F0A")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 0, axis: (x: 0, y: 1, z: 0))
          TextNode("0°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FF9500:#FF9F0A")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 30, axis: (x: 0, y: 1, z: 0))
          TextNode("30°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FF9500:#FF9F0A")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 60, axis: (x: 0, y: 1, z: 0))
          TextNode("60°")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FF9500:#FF9F0A")
            .frame(width: 60, height: 60)
            .rotation3DEffect(degrees: 90, axis: (x: 0, y: 1, z: 0))
          TextNode("90°")
            .font(size: 10)
        }
      }
    }
  }
}
