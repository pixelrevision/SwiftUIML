//
//  CornerRadiusTests.swift
//  SwiftUIML
//
//  CornerRadius modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class CornerRadiusTests: XCTestCase {
  @MainActor
  func testCornerRadiusSmall() {
    testNode(TestCase.modifier.cornerRadius.small, size: CGSize(width: 100, height: 80)) {
      ColorNode("#007AFF:#0A84FF")
        .frame(width: 80, height: 60)
        .cornerRadius(4)
    }
  }

  @MainActor
  func testCornerRadiusMedium() {
    testNode(TestCase.modifier.cornerRadius.medium, size: CGSize(width: 100, height: 80)) {
      ColorNode("#34C759:#30D158")
        .frame(width: 80, height: 60)
        .cornerRadius(12)
    }
  }

  @MainActor
  func testCornerRadiusLarge() {
    testNode(TestCase.modifier.cornerRadius.large, size: CGSize(width: 100, height: 80)) {
      ColorNode("#FF9500:#FF9F0A")
        .frame(width: 80, height: 60)
        .cornerRadius(24)
    }
  }
}
