//
//  CapsuleTests.swift
//  SwiftUIML
//
//  Capsule view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class CapsuleTests: XCTestCase {
  @MainActor
  func testCapsuleFilled() {
    testNode(TestCase.view.capsule.filled, size: CGSize(width: 120, height: 40)) {
      CapsuleNode()
        .foregroundColor("#007AFF:#0A84FF")
    }
  }

  @MainActor
  func testCapsuleStroked() {
    testNode(TestCase.view.capsule.stroked, size: CGSize(width: 120, height: 40)) {
      CapsuleNode()
        .stroke("#FF375F:#FF6482", lineWidth: 4)
    }
  }

  @MainActor
  func testCapsuleConditional() {
    testNode(TestCase.view.capsule.conditional, size: CGSize(width: 120, height: 40)) {
      CapsuleNode()
        .stroke("#FAD97D:#6E6BFF", lineWidth: 4)
    }
  }
}
