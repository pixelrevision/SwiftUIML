//
//  GaugeTests.swift
//  SwiftUIML
//
//  Gauge view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class GaugeTests: XCTestCase {
  @MainActor
  func testGaugeVariations() {
    testNode(TestCase.view.gauge.variations, size: CGSize(width: 240, height: 400)) {
      VStackNode(spacing: 20) {
        GaugeNode(value: 0.7) {
          TextNode("Speed")
            .foregroundColor("orange")
        }
        .minimumValueLabel(TextNode("Min: 0").foregroundColor("red"))
        .maximumValueLabel(TextNode("Max: 1").foregroundColor("green"))
        .currentValueLabel(TextNode("Current: 0.7").foregroundColor("blue"))

        GaugeNode("Temperature", value: 75, minimumValue: 0, maximumValue: 100)

        GaugeNode("Battery", value: 0.45)
          .tint("green")

        GaugeNode("Progress", value: 0.15)

        GaugeNode("Completion", value: 0.95)
          .tint("red")
      }
      .padding(20)
    }
  }
}
