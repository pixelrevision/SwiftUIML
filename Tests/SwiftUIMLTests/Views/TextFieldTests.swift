//
//  TextFieldTests.swift
//  SwiftUIML
//
//  TextField view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class TextFieldTests: XCTestCase {
  @MainActor
  func testTextFieldConfigurations() {
    testNode(
      TestCase.view.textField.configurations,
      size: CGSize(width: 300, height: 300),
      useHostingController: true
    ) {
      VStackNode(spacing: 20, alignment: .leading) {
        // Basic text field with placeholder
        TextFieldNode("Enter your name")

        // Text field with initial value
        TextFieldNode("Email", value: "user@example.com")

        // Text field with styling
        TextFieldNode("Search...")
          .padding(8)
          .background(ColorNode("#F0F0F0"))
          .cornerRadius(6)

        // Text field with border
        TextFieldNode("Username")
          .padding(8)
          .border("#007AFF", width: 1)
          .cornerRadius(6)

        // Text field with custom font
        TextFieldNode("Password")
          .font(.body)
          .foregroundColor("#333333")
      }
      .padding(20)
    }
  }
}
