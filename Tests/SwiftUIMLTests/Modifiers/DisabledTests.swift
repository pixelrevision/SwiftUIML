//
//  DisabledTests.swift
//  SwiftUIML
//
//  Disabled modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class DisabledTests: XCTestCase {
  @MainActor
  func testDisabledButton() {
    testNode(TestCase.modifier.disabled.button, size: CGSize(width: 300, height: 120)) {
      VStackNode(spacing: 16) {
        ButtonNode("Enabled Button", onTap: "tap")
          .buttonStyle(.borderedProminent)

        ButtonNode("Disabled Button", onTap: "tap")
          .buttonStyle(.borderedProminent)
          .disabled(true)
      }
    }
  }

  @MainActor
  func testDisabledText() {
    testNode(TestCase.modifier.disabled.text, size: CGSize(width: 300, height: 120)) {
      VStackNode(spacing: 16) {
        TextNode("Enabled Text")
          .font(.title2)
          .foregroundColor("#007AFF")

        TextNode("Disabled Text")
          .font(.title2)
          .foregroundColor("#007AFF")
          .disabled(true)
      }
    }
  }

  @MainActor
  func testDisabledMultipleControls() {
    testNode(TestCase.modifier.disabled.multipleControls, size: CGSize(width: 320, height: 280)) {
      VStackNode(spacing: 16) {
        TextNode("Form Controls")
          .font(.headline)

        HStackNode(spacing: 12) {
          ButtonNode("Save", onTap: "save")
            .buttonStyle(.bordered)

          ButtonNode("Cancel", onTap: "cancel")
            .buttonStyle(.bordered)
        }

        DividerNode()

        TextNode("Disabled State")
          .font(.headline)

        HStackNode(spacing: 12) {
          ButtonNode("Save", onTap: "save")
            .buttonStyle(.bordered)
            .disabled(true)

          ButtonNode("Cancel", onTap: "cancel")
            .buttonStyle(.bordered)
            .disabled(true)
        }
      }
      .padding(20)
    }
  }

  @MainActor
  func testDisabledWithColor() {
    testNode(TestCase.modifier.disabled.withColor, size: CGSize(width: 280, height: 200)) {
      VStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          TextNode("Red Button - Enabled")
            .font(.caption)
          ButtonNode("Delete", onTap: "delete")
            .buttonStyle(.borderedProminent)
            .tint("#FF3B30")
        }

        VStackNode(spacing: 8) {
          TextNode("Red Button - Disabled")
            .font(.caption)
          ButtonNode("Delete", onTap: "delete")
            .buttonStyle(.borderedProminent)
            .tint("#FF3B30")
            .disabled(true)
        }
      }
    }
  }
}
