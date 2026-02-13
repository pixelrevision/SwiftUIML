//
//  ColorSchemeTests.swift
//  SwiftUIML
//
//  ColorScheme modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ColorSchemeTests: XCTestCase {
  @MainActor
  func testColorSchemeForcedLight() {
    testNode(TestCase.modifier.colorScheme.forcedLight, size: CGSize(width: 100, height: 80)) {
      VStackNode {
        TextNode("Light")
          .foregroundColor("#000000:#FFFFFF")
          .background(ColorNode("#FFFFFF:#000000"))

        ColorNode("systemBackground")
          .frame(width: 60, height: 30)
      }
      .colorScheme(.light)
    }
  }

  @MainActor
  func testColorSchemeForcedDark() {
    testNode(TestCase.modifier.colorScheme.forcedDark, size: CGSize(width: 100, height: 80)) {
      VStackNode {
        TextNode("Dark")
          .foregroundColor("#000000:#FFFFFF")
          .background(ColorNode("#FFFFFF:#000000"))

        ColorNode("systemBackground")
          .frame(width: 60, height: 30)
      }
      .colorScheme(.dark)
    }
  }
}
