//
//  ClippedTests.swift
//  SwiftUIML
//
//  Clipped modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ClippedTests: XCTestCase {
  @MainActor
  func testClippedBasic() {
    testNode(TestCase.modifier.clipped.basic, size: CGSize(width: 300, height: 200)) {
      HStackNode(spacing: 32) {
        VStackNode(spacing: 8) {
          ZStackNode {
            ColorNode("#007AFF:#0A84FF")
              .frame(width: 100, height: 100)

            TextNode("Overflow Text That Is Very Long")
              .font(size: 20)
              .foregroundColor("#FFFFFF")
          }
          .frame(width: 80, height: 80)

          TextNode("Not Clipped")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          ZStackNode {
            ColorNode("#007AFF:#0A84FF")
              .frame(width: 100, height: 100)

            TextNode("Overflow Text That Is Very Long")
              .font(size: 20)
              .foregroundColor("#FFFFFF")
          }
          .frame(width: 80, height: 80)
          .clipped()

          TextNode("Clipped")
            .font(.caption)
        }
      }
    }
  }

  @MainActor
  func testClippedRotated() {
    testNode(TestCase.modifier.clipped.rotated, size: CGSize(width: 300, height: 180)) {
      HStackNode(spacing: 32) {
        VStackNode(spacing: 8) {
          ColorNode("#FF3B30:#FF453A")
            .frame(width: 80, height: 80)
            .rotationEffect(degrees: 45)
            .frame(width: 60, height: 60)

          TextNode("Not Clipped")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          ColorNode("#FF3B30:#FF453A")
            .frame(width: 80, height: 80)
            .rotationEffect(degrees: 45)
            .frame(width: 60, height: 60)
            .clipped()

          TextNode("Clipped")
            .font(.caption)
        }
      }
    }
  }

  @MainActor
  func testClippedScaled() {
    testNode(TestCase.modifier.clipped.scaled, size: CGSize(width: 300, height: 180)) {
      HStackNode(spacing: 32) {
        VStackNode(spacing: 8) {
          CircleNode()
            .fill("#34C759:#30D158")
            .frame(width: 100, height: 100)
            .frame(width: 60, height: 60)

          TextNode("Not Clipped")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          CircleNode()
            .fill("#34C759:#30D158")
            .frame(width: 100, height: 100)
            .frame(width: 60, height: 60)
            .clipped()

          TextNode("Clipped")
            .font(.caption)
        }
      }
    }
  }
}
