//
//  PickerStyleTests.swift
//  SwiftUIML
//
//  PickerStyle modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class PickerStyleTests: XCTestCase {
  @MainActor
  func testPickerStyleVariations() {
    testNode(
      TestCase.modifier.pickerStyle.variations,
      size: CGSize(width: 350, height: 450),
      useHostingController: true
    ) {
      VStackNode(spacing: 20) {
        PickerNode("Menu", selection: "a") {
          TextNode("Option A").tag("a")
          TextNode("Option B").tag("b")
          TextNode("Option C").tag("c")
        }
        .pickerStyle(.menu)

        PickerNode("Segmented", selection: "a") {
          TextNode("Option A").tag("a")
          TextNode("Option B").tag("b")
          TextNode("Option C").tag("c")
        }
        .pickerStyle(.segmented)

        PickerNode("Wheel", selection: "b") {
          TextNode("Option A").tag("a")
          TextNode("Option B").tag("b")
          TextNode("Option C").tag("c")
        }
        .pickerStyle(.wheel)
        .frame(height: 150)
      }
      .padding(20)
    }
  }
}
