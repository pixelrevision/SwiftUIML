//
//  ControlGroupTests.swift
//  SwiftUIML
//
//  ControlGroup view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ControlGroupTests: XCTestCase {
  @MainActor
  func testControlGroupBasic() {
    testNode(TestCase.view.controlGroup.basic, size: CGSize(width: 250, height: 80), useHostingController: true) {
      ControlGroupNode {
        ButtonNode("Bold", onTap: "bold")
        ButtonNode("Italic", onTap: "italic")
        ButtonNode("Underline", onTap: "underline")
      }
      .buttonStyle(.bordered)
      .padding(20)
    }
  }
}
