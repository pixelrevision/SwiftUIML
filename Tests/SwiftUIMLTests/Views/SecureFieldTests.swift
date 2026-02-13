//
//  SecureFieldTests.swift
//  SwiftUIML
//
//  SecureField view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class SecureFieldTests: XCTestCase {
  @MainActor
  func testSecureFieldBasic() {
    testNode(TestCase.view.secureField.basic, size: CGSize(width: 300, height: 80), useHostingController: true) {
      SecureFieldNode("Enter password", value: "secret123")
        .padding(10)
        .background(ColorNode("#F5F5F5"))
        .cornerRadius(8)
        .padding(20)
    }
  }
}
