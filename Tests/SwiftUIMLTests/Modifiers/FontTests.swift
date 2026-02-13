//
//  FontTests.swift
//  SwiftUIML
//
//  Font modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class FontTests: XCTestCase {
  @MainActor
  func testFontStyles() {
    testNode(TestCase.modifier.font.styles, size: CGSize(width: 300, height: 400)) {
      VStackNode(spacing: 12) {
        TextNode("Large Title")
          .font(.largeTitle)

        TextNode("Title")
          .font(.title)

        TextNode("Title 2")
          .font(.title2)

        TextNode("Title 3")
          .font(.title3)

        TextNode("Headline")
          .font(.headline)

        TextNode("Body")
          .font(.body)

        TextNode("Callout")
          .font(.callout)

        TextNode("Subheadline")
          .font(.subheadline)

        TextNode("Footnote")
          .font(.footnote)

        TextNode("Caption")
          .font(.caption)

        TextNode("Caption 2")
          .font(.caption2)
      }
    }
  }

  @MainActor
  func testFontSizes() {
    testNode(TestCase.modifier.font.sizes, size: CGSize(width: 250, height: 250)) {
      VStackNode(spacing: 8) {
        TextNode("Size 10")
          .font(size: 10)

        TextNode("Size 14")
          .font(size: 14)

        TextNode("Size 18")
          .font(size: 18)

        TextNode("Size 24")
          .font(size: 24)

        TextNode("Size 32")
          .font(size: 32)

        TextNode("Size 48")
          .font(size: 48)
      }
    }
  }

  @MainActor
  func testFontWeightsWithStyle() {
    testNode(TestCase.modifier.font.weightsWithStyle, size: CGSize(width: 250, height: 350)) {
      VStackNode(spacing: 8) {
        TextNode("Title - Ultralight")
          .font(.title)
          .fontWeight(.ultraLight)

        TextNode("Title - Light")
          .font(.title)
          .fontWeight(.light)

        TextNode("Title - Regular")
          .font(.title)
          .fontWeight(.regular)

        TextNode("Title - Medium")
          .font(.title)
          .fontWeight(.medium)

        TextNode("Title - Semibold")
          .font(.title)
          .fontWeight(.semibold)

        TextNode("Title - Bold")
          .font(.title)
          .fontWeight(.bold)

        TextNode("Title - Heavy")
          .font(.title)
          .fontWeight(.heavy)

        TextNode("Title - Black")
          .font(.title)
          .fontWeight(.black)
      }
    }
  }

  @MainActor
  func testFontDesigns() {
    testNode(TestCase.modifier.font.designs, size: CGSize(width: 250, height: 180)) {
      VStackNode(spacing: 12) {
        TextNode("Default Design")
          .font(size: 22)

        TextNode("Rounded Design")
          .font(size: 22, design: .rounded)

        TextNode("Monospaced Design")
          .font(size: 22, design: .monospaced)

        TextNode("Serif Design")
          .font(size: 22, design: .serif)
      }
    }
  }

  @MainActor
  func testFontCustomSize() {
    testNode(TestCase.modifier.font.customSize, size: CGSize(width: 300, height: 200)) {
      VStackNode(spacing: 10) {
        TextNode("Custom 12pt Regular")
          .font(size: 12, weight: .regular)

        TextNode("Custom 16pt Medium")
          .font(size: 16, weight: .medium)

        TextNode("Custom 20pt Bold")
          .font(size: 20, weight: .bold)

        TextNode("Custom 28pt Black")
          .font(size: 28, weight: .black)
      }
    }
  }
}
