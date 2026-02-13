//
//  ButtonStyleTests.swift
//  SwiftUIML
//
//  ButtonStyle modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ButtonStyleTests: XCTestCase {
  @MainActor
  func testButtonStyleVariations() {
    testNode(TestCase.modifier.buttonStyle.variations, size: CGSize(width: 200, height: 300)) {
      VStackNode(spacing: 20) {
        ButtonNode("Automatic Style", onTap: "test")
          .buttonStyle(.automatic)

        ButtonNode("Plain Style", onTap: "test")
          .buttonStyle(.plain)

        ButtonNode("Bordered Style", onTap: "test")
          .buttonStyle(.bordered)

        ButtonNode("Bordered Prominent", onTap: "test")
          .buttonStyle(.borderedProminent)

        ButtonNode("Borderless Style", onTap: "test")
          .buttonStyle(.borderless)
      }
      .padding(20)
    }
  }
}
