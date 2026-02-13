//
//  ColorSchemeViewTests.swift
//  SwiftUIML
//
//  ColorScheme view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ColorSchemeViewTests: XCTestCase {
  @MainActor
  func testBasicSchemeSwitch() {
    testNode(TestCase.view.colorScheme.basicSwitch, size: CGSize(width: 100, height: 50)) {
      ColorSchemeNode {
        TextNode("Light Mode")
        TextNode("Dark Mode")
          .foregroundColor("#FFFFFF")
      }
    }
  }

  @MainActor
  func testDefaultsToLight() {
    testNode(TestCase.view.colorScheme.defaultsLight, size: CGSize(width: 100, height: 50)) {
      ColorSchemeNode {
        TextNode("Light Mode")
          .foregroundColor("#FF375F")
      }
    }
  }

  @MainActor
  func testRespectsSystemOverride() {
    testNode(TestCase.view.colorScheme.respectsOverride, size: CGSize(width: 100, height: 50)) {
      HStackNode {
        ColorSchemeNode {
          TextNode("Light Mode")
            .foregroundColor("#000000")
            .backgroundColor("#FFFFFF")
          TextNode("Dark Mode")
            .foregroundColor("#FFFFFF")
        }
      }.colorScheme(.light)
    }
  }
}
