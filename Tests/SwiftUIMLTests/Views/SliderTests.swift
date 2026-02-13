//
//  SliderTests.swift
//  SwiftUIML
//
//  Slider view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class SliderTests: XCTestCase {
  @MainActor
  func testSliderConfigurations() {
    testNode(TestCase.view.slider.configurations, size: CGSize(width: 300, height: 300), useHostingController: true) {
      VStackNode(spacing: 20, alignment: .leading) {
        // Basic slider with default range (0.0 to 1.0)
        SliderNode()

        // Slider with custom value
        SliderNode(value: 0.75)

        // Slider with custom range (0 to 100)
        SliderNode(value: 50, minimumValue: 0, maximumValue: 100)

        // Slider with step value
        SliderNode(value: 5, minimumValue: 0, maximumValue: 10, step: 1)

        // Slider with styling
        SliderNode(value: 0.6)
          .padding(8)
          .background(ColorNode("#F0F0F0"))
          .cornerRadius(6)
      }
      .padding(20)
    }
  }
}
