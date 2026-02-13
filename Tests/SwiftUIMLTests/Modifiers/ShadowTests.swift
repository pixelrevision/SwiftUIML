//
//  ShadowTests.swift
//  SwiftUIML
//
//  Shadow modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ShadowTests: XCTestCase {
  @MainActor
  func testShadowDrop() {
    testNode(TestCase.modifier.shadow.drop, size: CGSize(width: 120, height: 80)) {
      TextNode("Shadow")
        .padding(16)
        .background(ColorNode("#FFFFFF:#1C1C1E"))
        .cornerRadius(8)
        .shadow(color: "#00000033:#00000033", radius: 4, x: 0, y: 2)
    }
  }

  @MainActor
  func testShadowColored() {
    testNode(TestCase.modifier.shadow.colored, size: CGSize(width: 120, height: 80)) {
      TextNode("Shadow")
        .padding(16)
        .background(ColorNode("#FFFFFF:#1C1C1E"))
        .cornerRadius(8)
        .shadow(color: "#007AFF66:#0A84FF66", radius: 6, x: 0, y: 0)
    }
  }

  @MainActor
  func testShadowLargeRadius() {
    testNode(TestCase.modifier.shadow.largeRadius, size: CGSize(width: 120, height: 80)) {
      TextNode("Shadow")
        .padding(16)
        .background(ColorNode("#FFFFFF:#1C1C1E"))
        .cornerRadius(8)
        .shadow(color: "#00000044:#00000044", radius: 12, x: 0, y: 4)
    }
  }

  @MainActor
  func testShadowToGlow() {
    testNode(TestCase.modifier.shadow.toGlow, size: CGSize(width: 120, height: 80)) {
      TextNode("Glow")
        .padding(16)
        .background(ColorNode("#FFFFFF:#1C1C1E"))
        .cornerRadius(8)
        .shadow(color: "#00000066:#FFFFFFAA", radius: 8, x: 0, y: 0)
    }
  }
}
