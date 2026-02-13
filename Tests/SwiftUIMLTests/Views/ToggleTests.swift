//
//  ToggleTests.swift
//  SwiftUIML
//
//  Toggle view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ToggleTests: XCTestCase {
  @MainActor
  func testToggleConfigurations() {
    testNode(TestCase.view.toggle.configurations, size: CGSize(width: 300, height: 300), useHostingController: true) {
      VStackNode(spacing: 20, alignment: .leading) {
        // Basic toggle (off)
        ToggleNode("Enable notifications")

        // Toggle with initial on state
        ToggleNode("Dark mode", isOn: true)

        // Toggle with custom font
        ToggleNode("Wi-Fi")
          .font(.headline)

        // Toggle with foreground color
        ToggleNode("Airplane mode")
          .foregroundColor("#007AFF")

        // Toggle with both on state and styling
        ToggleNode("Bluetooth", isOn: true)
          .font(.body)
          .foregroundColor("#333333")
      }
      .padding(20)
    }
  }
}
