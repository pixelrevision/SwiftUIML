//
//  FormTests.swift
//  SwiftUIML
//
//  Form view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class FormTests: XCTestCase {
  @MainActor
  func testFormMixedControls() {
    testNode(TestCase.view.form.mixedControls, size: CGSize(width: 350, height: 550), useHostingController: true) {
      FormNode {
        SectionNode {
          // Pickers in Form show labels prominently
          PickerNode("Fruit", selection: "apple") {
            TextNode("Apple").tag("apple")
            TextNode("Banana").tag("banana")
            TextNode("Orange").tag("orange")
          }

          PickerNode("Color", selection: "red") {
            TextNode("Red").tag("red")
            TextNode("Green").tag("green")
            TextNode("Blue").tag("blue")
          }
        }

        SectionNode {
          ToggleNode("Dark Mode", isOn: true)
          ToggleNode("Notifications", isOn: false)
        }

        SectionNode {
          TextFieldNode("Username", value: "john_doe")
          TextFieldNode("Email", value: "john@example.com")
        }
      }
    }
  }
}
