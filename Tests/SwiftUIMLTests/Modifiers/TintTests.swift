//
//  TintTests.swift
//  SwiftUIML
//
//  Tint modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class TintTests: XCTestCase {
  @MainActor
  func testTintButton() {
    testNode(TestCase.modifier.tint.button, size: CGSize(width: 300, height: 280)) {
      VStackNode(spacing: 16) {
        TextNode("Bordered Buttons")
          .font(.headline)

        HStackNode(spacing: 12) {
          ButtonNode("Blue", onTap: "tap")
            .buttonStyle(.bordered)
            .tint("#007AFF")

          ButtonNode("Red", onTap: "tap")
            .buttonStyle(.bordered)
            .tint("#FF3B30")

          ButtonNode("Green", onTap: "tap")
            .buttonStyle(.bordered)
            .tint("#34C759")
        }

        TextNode("Prominent Buttons")
          .font(.headline)

        HStackNode(spacing: 12) {
          ButtonNode("Purple", onTap: "tap")
            .buttonStyle(.borderedProminent)
            .tint("#5856D6")

          ButtonNode("Orange", onTap: "tap")
            .buttonStyle(.borderedProminent)
            .tint("#FF9500")

          ButtonNode("Pink", onTap: "tap")
            .buttonStyle(.borderedProminent)
            .tint("#FF2D55")
        }
      }
    }
  }

  @MainActor
  func testTintProgressView() {
    testNode(TestCase.modifier.tint.progressView, size: CGSize(width: 280, height: 200), useHostingController: true) {
      VStackNode(spacing: 20) {
        VStackNode(spacing: 8) {
          ProgressViewNode()
            .tint("#007AFF")
          TextNode("Blue Progress")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          ProgressViewNode()
            .tint("#FF3B30")
          TextNode("Red Progress")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          ProgressViewNode()
            .tint("#34C759")
          TextNode("Green Progress")
            .font(.caption)
        }
      }
      .frame(width: 200)
    }
  }
}
