//
//  ColorTests.swift
//  SwiftUIML
//
//  Color view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ColorTests: XCTestCase {
  @MainActor
  func testColorSolid() {
    testNode(TestCase.view.color.solid, size: CGSize(width: 50, height: 50)) {
      ColorNode("#007AFF")
    }
  }

  @MainActor
  func testColorAlpha() {
    testNode(TestCase.view.color.alpha, size: CGSize(width: 50, height: 50)) {
      ColorNode("#FF0000")
        .opacity(0.5)
    }
  }

  @MainActor
  func testColorConditional() {
    testNode(TestCase.view.color.conditional, size: CGSize(width: 50, height: 50)) {
      ColorNode("#007AFF:#64D2FF")
    }
  }

  @MainActor
  func testColorConditionalAlpha() {
    testNode(TestCase.view.color.conditionalAlpha, size: CGSize(width: 50, height: 50)) {
      ColorNode("#FF375F80:#FF669080")
    }
  }

  @MainActor
  func testColorSystemColors() {
    let allColors = [
      // Basic Colors
      "red", "blue", "green", "orange", "yellow", "purple", "pink",
      "black", "white", "gray", "primary", "secondary", "clear",
      // Label Colors
      "label", "secondaryLabel", "tertiaryLabel", "quaternaryLabel",
      // Background Colors
      "systemBackground", "secondarySystemBackground", "tertiarySystemBackground",
      // Grouped Background Colors
      "systemGroupedBackground", "secondarySystemGroupedBackground", "tertiarySystemGroupedBackground",
      // Fill Colors
      "systemFill", "secondarySystemFill", "tertiarySystemFill", "quaternarySystemFill",
      // Separator Colors
      "separator", "opaqueSeparator",
      // Link Color
      "link",
      // System Colors
      "systemRed", "systemBlue", "systemGreen", "systemOrange", "systemYellow",
      "systemPink", "systemPurple", "systemTeal", "systemIndigo",
      "systemBrown", "systemMint", "systemCyan",
      // System Grays
      "systemGray", "systemGray2", "systemGray3",
      "systemGray4", "systemGray5", "systemGray6",
    ]

    // Create rows of 3 colors each
    var rows: [[String]] = []
    for i in stride(from: 0, to: allColors.count, by: 3) {
      let endIndex = min(i + 3, allColors.count)
      rows.append(Array(allColors[i..<endIndex]))
    }

    testNode(TestCase.view.color.systemColors, size: CGSize(width: 750, height: 600)) {
      GridNode(horizontalSpacing: 2, verticalSpacing: 2) {
        ForEachNode(rows) { row in
          GridRowNode {
            ForEachNode(row) { colorName in
              TextNode(colorName)
                .font(.caption2)
                .foregroundColor("label")
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(ColorNode(colorName))
            }
          }
        }
      }
      .padding(8)
    }
  }
}
