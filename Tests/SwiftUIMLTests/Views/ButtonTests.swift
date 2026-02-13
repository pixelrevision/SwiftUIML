//
//  ButtonTests.swift
//  SwiftUIML
//
//  Button view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ButtonTests: XCTestCase {
  @MainActor
  func testButtonBasic() {
    testNode(TestCase.view.button.basic, size: CGSize(width: 120, height: 40)) {
      ButtonNode("Tap Me", onTap: "tap")
    }
  }

  @MainActor
  func testButtonStyled() {
    testNode(TestCase.view.button.styled, size: CGSize(width: 120, height: 40)) {
      ButtonNode("Styled", onTap: "tap")
        .foregroundColor("#007AFF")
        .padding(12)
        .background(ColorNode("#007AFF").opacity(0.1))
        .cornerRadius(8)
    }
  }
}
