//
//  ToggleStyleTests.swift
//  SwiftUIML
//
//  ToggleStyle modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ToggleStyleTests: XCTestCase {
  @MainActor
  func testToggleStyleVariations() {
    testNode(
      TestCase.modifier.toggleStyle.variations,
      size: CGSize(width: 350, height: 250),
      useHostingController: true
    ) {
      VStackNode(spacing: 20) {
        ToggleNode("Automatic", isOn: true)
          .toggleStyle(.automatic)

        ToggleNode("Switch", isOn: true)
          .toggleStyle(.switch)

        ToggleNode("Button", isOn: false)
          .toggleStyle(.button)
      }
      .padding(20)
    }
  }
}
