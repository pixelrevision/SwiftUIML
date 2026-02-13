//
//  DisclosureGroupTests.swift
//  SwiftUIML
//
//  DisclosureGroup view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class DisclosureGroupTests: XCTestCase {
  @MainActor
  func testDisclosureGroupConfigurations() {
    testNode(
      TestCase.view.disclosureGroup.configurations,
      size: CGSize(width: 350, height: 600),
      useHostingController: true
    ) {
      FormNode {
        SectionNode {
          // Basic DisclosureGroup (collapsed by default)
          DisclosureGroupNode("Basic Details") {
            TextNode("This is basic content")
            TextNode("It can contain multiple items")
          }

          // DisclosureGroup expanded by default
          DisclosureGroupNode("Settings", isExpanded: true) {
            ToggleNode("Dark Mode", isOn: true)
            ToggleNode("Notifications", isOn: false)
            SliderNode(value: 0.7)
          }

          // Nested DisclosureGroups
          DisclosureGroupNode("Advanced Options") {
            DisclosureGroupNode("Network", isExpanded: true) {
              TextNode("WiFi: Connected")
              TextNode("Cellular: Enabled")
            }
            DisclosureGroupNode("Privacy") {
              TextNode("Location Services: On")
              TextNode("Analytics: Off")
            }
          }

          // DisclosureGroup with event handler
          DisclosureGroupNode("Preferences", isExpanded: false) {
            PickerNode("Theme", selection: "light") {
              TextNode("Light").tag("light")
              TextNode("Dark").tag("dark")
              TextNode("Auto").tag("auto")
            }
            StepperNode("Font Size", value: 14.0, minimumValue: 10.0, maximumValue: 24.0, step: 2.0)
          }
          .onExpandedChange("preferencesExpanded")
        }
      }
    }
  }
}
