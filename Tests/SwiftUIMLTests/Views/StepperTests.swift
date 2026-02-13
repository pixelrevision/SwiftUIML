//
//  StepperTests.swift
//  SwiftUIML
//
//  Stepper view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class StepperTests: XCTestCase {
  @MainActor
  func testStepperConfigurations() {
    testNode(TestCase.view.stepper.configurations, size: CGSize(width: 300, height: 400), useHostingController: true) {
      VStackNode(spacing: 20, alignment: .leading) {
        // Basic stepper with default range (0 to 100)
        StepperNode("Volume")

        // Stepper with custom value
        StepperNode("Brightness", value: 50)

        // Stepper with custom range (0 to 10)
        StepperNode("Level", value: 5, minimumValue: 0, maximumValue: 10)

        // Stepper with custom step value
        StepperNode("Count", value: 10, minimumValue: 0, maximumValue: 100, step: 5)

        // Stepper with styling
        StepperNode("Temperature", value: 72, minimumValue: 60, maximumValue: 80)
          .padding(8)
          .background(ColorNode("#F0F0F0"))
          .cornerRadius(6)
      }
      .padding(20)
    }
  }
}
