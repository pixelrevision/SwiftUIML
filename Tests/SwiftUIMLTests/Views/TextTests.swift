//
//  TextTests.swift
//  SwiftUIML
//
//  Text view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class TextTests: XCTestCase {
  @MainActor
  func testTextBasic() {
    testNode(TestCase.view.text.basic, size: CGSize(width: 50, height: 20)) {
      TextNode("hello")
    }
  }

  @MainActor
  func testTextMarkdown() {
    testNode(TestCase.view.text.markdown, size: CGSize(width: 160, height: 30)) {
      TextNode(markdown: "**Bold** and *Italic*")
    }
  }

  @MainActor
  func testTextCustomFont() throws {
    let font = try registerFont(name: "Splash-Regular")
    testNode(TestCase.view.text.customFont, size: CGSize(width: 60, height: 30)) {
      TextNode("Custom")
        .customFont(name: font, size: 12)
    }
  }
}
