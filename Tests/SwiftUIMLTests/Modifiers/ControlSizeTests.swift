//
//  ControlSizeTests.swift
//  SwiftUIML
//
//  ControlSize modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ControlSizeTests: XCTestCase {
  @MainActor
  func testControlSizeVariations() {
    testNode(TestCase.modifier.controlSize.variations, size: CGSize(width: 250, height: 400)) {
      VStackNode(spacing: 20) {
        ButtonNode("Mini", onTap: "test")
          .buttonStyle(.bordered)
          .controlSize(.mini)

        ButtonNode("Small", onTap: "test")
          .buttonStyle(.bordered)
          .controlSize(.small)

        ButtonNode("Regular", onTap: "test")
          .buttonStyle(.bordered)
          .controlSize(.regular)

        ButtonNode("Large", onTap: "test")
          .buttonStyle(.bordered)
          .controlSize(.large)

        ButtonNode("Extra Large", onTap: "test")
          .buttonStyle(.bordered)
          .controlSize(.extraLarge)
      }
      .padding(20)
    }
  }
}
