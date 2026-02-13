//
//  ButtonBorderShapeTests.swift
//  SwiftUIML
//
//  ButtonBorderShape modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ButtonBorderShapeTests: XCTestCase {
  @MainActor
  func testButtonBorderShapeVariations() {
    testNode(TestCase.modifier.buttonBorderShape.variations, size: CGSize(width: 300, height: 250)) {
      VStackNode(spacing: 20) {
        ButtonNode("Automatic", onTap: "test")
          .buttonStyle(.bordered)
          .buttonBorderShape(.automatic)

        ButtonNode("Capsule", onTap: "test")
          .buttonStyle(.bordered)
          .buttonBorderShape(.capsule)

        ButtonNode("Rounded Rectangle", onTap: "test")
          .buttonStyle(.bordered)
          .buttonBorderShape(.roundedRectangle)
      }
      .padding(20)
    }
  }
}
