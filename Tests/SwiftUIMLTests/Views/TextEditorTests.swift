//
//  TextEditorTests.swift
//  SwiftUIML
//
//  TextEditor view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class TextEditorTests: XCTestCase {
  @MainActor
  func testTextEditorBasic() {
    testNode(TestCase.view.textEditor.basic, size: CGSize(width: 340, height: 210), useHostingController: true) {
      TextEditorNode(value: "This is a multi-line text editor.\n\nYou can type multiple lines of text here.")
        .frame(width: 300, height: 150)
        .padding(10)
        .background(ColorNode("#F5F5F5"))
        .cornerRadius(8)
        .padding(20)
    }
  }
}
