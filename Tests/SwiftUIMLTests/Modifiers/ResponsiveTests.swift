//
//  ResponsiveTests.swift
//  SwiftUIML
//
//  Responsive modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ResponsiveTests: XCTestCase {
  // MARK: - Helper Functions

  /// Creates a VStack showing a responsive node at different widths
  private func widthProgression(
    widths: [Double],
    spacing: Double = 8,
    content: @escaping (Double) -> Node
  ) -> Node {
    VStackNode(spacing: spacing) {
      for width in widths {
        VStackNode(spacing: 2) {
          // Label showing the width
          TextNode("\(Int(width))w")
            .font(.caption2)
            .foregroundColor("#8E8E93:#98989D")
            .frame(width: 40)

          // Container at specific width
          content(width)
            .frame(width: width)
        }
        .backgroundColor("#AEAEB233:#3A3A3C33")
      }
    }
    .padding(8)
  }

  /// Creates an HStack showing a responsive node at different heights
  private func heightProgression(
    heights: [Double],
    spacing: Double = 8,
    content: @escaping (Double) -> Node
  ) -> Node {
    HStackNode(spacing: spacing) {
      for height in heights {
        VStackNode(spacing: 2) {
          // Label showing the height
          TextNode("\(Int(height))h")
            .font(.caption2)
            .foregroundColor("#8E8E93:#98989D")
            .frame(height: 20)

          // Container at specific height
          content(height)
            .frame(height: height)
        }
        .backgroundColor("#AEAEB233:#3A3A3C33")
      }
    }
    .padding(8)
  }

  // MARK: - Width-Based Tests

  @MainActor
  func testResponsiveCascadingWidth() {
    testNode(TestCase.modifier.responsive.cascadingWidth, size: CGSize(width: 150, height: 400)) {
      widthProgression(widths: [25, 50, 75, 100, 125]) { _ in
        ColorNode("clear")
          .frame(maxWidth: .infinity)
          .responsive([
            .w(0): [
              .backgroundColor: .string("#FF3B30:#FF453A")
            ],
            .w(50): [
              .backgroundColor: .string("#FF9500:#FF9F0A")
            ],
            .w(100): [
              .backgroundColor: .string("#34C759:#30D158")
            ],
          ])
      }
    }
  }

  @MainActor
  func testResponsiveCascadingHeight() {
    testNode(TestCase.modifier.responsive.cascadingHeight, size: CGSize(width: 350, height: 150)) {
      heightProgression(heights: [25, 50, 75, 100, 125]) { _ in
        ColorNode("clear")
          .frame(maxWidth: .infinity)
          .responsive([
            .h(0): [
              .backgroundColor: .string("#FF3B30:#FF453A")
            ],
            .h(50): [
              .backgroundColor: .string("#FF9500:#FF9F0A")
            ],
            .h(100): [
              .backgroundColor: .string("#34C759:#30D158")
            ],
          ])
      }
    }
  }

  @MainActor
  func testResponsiveCascadingWidthDescending() {
    testNode(TestCase.modifier.responsive.cascadingWidthDescending, size: CGSize(width: 150, height: 400)) {
      widthProgression(widths: [125, 100, 75, 50, 25]) { _ in
        ColorNode("clear")
          .frame(maxWidth: .infinity)
          .responsive([
            .wLessThan(50): [
              .backgroundColor: .string("#FF3B30:#FF453A")
            ],
            .wLessThan(75): [
              .backgroundColor: .string("#FF9500:#FF9F0A")
            ],
            .wLessThan(110): [
              .backgroundColor: .string("#34C759:#30D158")
            ],
          ])
      }
    }
  }

  @MainActor
  func testResponsiveCascadingHeightDescending() {
    testNode(TestCase.modifier.responsive.cascadingHeightDescending, size: CGSize(width: 350, height: 150)) {
      heightProgression(heights: [125, 100, 75, 50, 25]) { _ in
        ColorNode("clear")
          .frame(maxWidth: .infinity)
          .responsive([
            .hLessThan(50): [
              .backgroundColor: .string("#FF3B30:#FF453A")
            ],
            .hLessThan(75): [
              .backgroundColor: .string("#FF9500:#FF9F0A")
            ],
            .hLessThan(110): [
              .backgroundColor: .string("#34C759:#30D158")
            ],
          ])
      }
    }
  }

  @MainActor
  func testResponsiveMixedOperators() {
    testNode(TestCase.modifier.responsive.mixedOperators, size: CGSize(width: 350, height: 350)) {
      widthProgression(widths: [50, 100, 150, 200, 250]) { _ in
        ColorNode("clear")
          .frame(maxWidth: .infinity)
          .responsive([
            .w(100): [
              .backgroundColor: .string("#FF3B30:#FF453A")
            ],
            .wLessThan(200): [
              .backgroundColor: .string("#34C759:#30D158")
            ],
          ])
      }
    }
  }

  @MainActor
  func testResponsiveWidthRanges() {
    testNode(TestCase.modifier.responsive.widthRanges, size: CGSize(width: 200, height: 450)) {
      widthProgression(widths: [25, 50, 75, 100, 125, 150]) { _ in
        ColorNode("clear")
          .frame(maxWidth: .infinity)
          .responsive([
            .w(50) + .wLessThan(100): [
              .backgroundColor: .string("#FF3B30:#FF453A")
            ],
            .w(100) + .wLessThan(150): [
              .backgroundColor: .string("#FF9500:#FF9F0A")
            ],
            .w(150): [
              .backgroundColor: .string("#34C759:#30D158")
            ],
          ])
      }
    }
  }
}
