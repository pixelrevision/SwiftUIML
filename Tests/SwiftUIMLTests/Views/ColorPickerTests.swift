//
//  ColorPickerTests.swift
//  SwiftUIML
//
//  ColorPicker view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ColorPickerTests: XCTestCase {
  @MainActor
  func testColorPickerConfigurations() {
    testNode(
      TestCase.view.colorPicker.configurations,
      size: CGSize(width: 350, height: 200),
      useHostingController: true
    ) {
      FormNode {
        SectionNode {
          // Basic ColorPicker
          ColorPickerNode("Pick a color")
            .onColorChange("colorChanged")

          // ColorPicker with initial color
          ColorPickerNode("Theme Color", value: "#FF5733")
            .onColorChange([.action: "themeColorChanged"])

          // ColorPicker without opacity
          ColorPickerNode("Solid Color", value: "#00AAFFFF")
            .supportsOpacity(false)
            .onColorChange("solidColorChanged")
        }
      }
    }
  }
}
