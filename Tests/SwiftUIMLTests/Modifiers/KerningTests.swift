//
//  KerningTests.swift
//  SwiftUIML
//
//  Kerning modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class KerningTests: XCTestCase {
  @MainActor
  func testKerningVariations() {
    testNode(TestCase.modifier.kerning.variations, size: CGSize(width: 200, height: 150)) {
      VStackNode(spacing: 20) {
        TextNode("Normal kerning")
          .font(size: 20)

        TextNode("Tight kerning")
          .font(size: 20)
          .kerning(-2)

        TextNode("Loose kerning")
          .font(size: 20)
          .kerning(5)
      }
    }
  }

  @MainActor
  func testKerningDifferentValues() {
    testNode(TestCase.modifier.kerning.differentValues, size: CGSize(width: 200, height: 150)) {
      VStackNode(spacing: 16) {
        TextNode("Kerning -4")
          .font(size: 18)
          .kerning(-4)

        TextNode("Kerning 0")
          .font(size: 18)
          .kerning(0)

        TextNode("Kerning 3")
          .font(size: 18)
          .kerning(3)

        TextNode("Kerning 10")
          .font(size: 18)
          .kerning(10)
      }
    }
  }
}
