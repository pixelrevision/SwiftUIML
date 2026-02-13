//
//  SpacerTests.swift
//  SwiftUIML
//
//  Spacer view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class SpacerTests: XCTestCase {
  @MainActor
  func testSpacerHorizontal() {
    testNode(TestCase.view.spacer.horizontal, size: CGSize(width: 100, height: 100)) {
      HStackNode {
        ColorNode("#00FF00:#FF0000")
        SpacerNode()
        ColorNode("#00FF00:#FF0000")
        SpacerNode()
        ColorNode("#00FF00:#FF0000")
      }
    }
  }

  @MainActor
  func testSpacerVertical() {
    testNode(TestCase.view.spacer.vertical, size: CGSize(width: 100, height: 100)) {
      VStackNode {
        ColorNode("#00FF00:#FF0000")
        SpacerNode()
        ColorNode("#00FF00:#FF0000")
        SpacerNode()
        ColorNode("#00FF00:#FF0000")
      }
    }
  }
}
