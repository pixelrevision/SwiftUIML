//
//  PickerTests.swift
//  SwiftUIML
//
//  Picker view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class PickerTests: XCTestCase {
  @MainActor
  func testPickerConfigurations() {
    testNode(TestCase.view.picker.configurations, size: CGSize(width: 350, height: 450), useHostingController: true) {
      FormNode {
        SectionNode {
          // In a Form, Picker labels are prominently displayed
          PickerNode("Fruit") {
            TextNode("Apple").tag("apple")
            TextNode("Banana").tag("banana")
            TextNode("Orange").tag("orange")
          }

          PickerNode("Color", selection: "red") {
            TextNode("Red").tag("red")
            TextNode("Green").tag("green")
            TextNode("Blue").tag("blue")
          }

          PickerNode("Size", selection: "medium") {
            TextNode("Small").tag("small")
            TextNode("Medium").tag("medium")
            TextNode("Large").tag("large")
            TextNode("Extra Large").tag("xlarge")
          }

          PickerNode("Theme", selection: "light") {
            TextNode("Light").tag("light")
            TextNode("Dark").tag("dark")
            TextNode("Auto").tag("auto")
          }
          .onPickerChange("themeChanged")
        }
      }
    }
  }
}
