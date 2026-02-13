//
//  IgnoresSafeAreaTests.swift
//  SwiftUIML
//
//  IgnoresSafeArea modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class IgnoresSafeAreaTests: XCTestCase {
  @MainActor
  func testIgnoresSafeAreaAll() {
    testNode(TestCase.modifier.ignoresSafeArea.all, size: CGSize(width: 400, height: 600)) {
      ZStackNode(alignment: .top) {
        // Background that ignores safe area (red)
        ColorNode("#FF0000:#FF453A")
          .ignoresSafeArea()

        // Foreground that respects safe area (blue with padding)
        VStackNode {
          ColorNode("#0000FF:#0A84FF")
            .frame(height: 50)

          SpacerNode()
        }
      }
    }
  }

  @MainActor
  func testIgnoresSafeAreaTop() {
    testNode(TestCase.modifier.ignoresSafeArea.top, size: CGSize(width: 400, height: 600)) {
      ZStackNode(alignment: .top) {
        // Background that ignores top safe area (red)
        ColorNode("#FF0000:#FF453A")
          .frame(height: 100)
          .ignoresSafeArea(.top)

        // Foreground that respects safe area (blue)
        VStackNode {
          ColorNode("#0000FF:#0A84FF")
            .frame(height: 50)

          SpacerNode()
        }
      }
    }
  }

  @MainActor
  func testIgnoresSafeAreaBottom() {
    testNode(TestCase.modifier.ignoresSafeArea.bottom, size: CGSize(width: 400, height: 600)) {
      ZStackNode(alignment: .bottom) {
        // Content that respects safe area
        VStackNode {
          SpacerNode()

          ColorNode("#0000FF:#0A84FF")
            .frame(height: 50)
        }

        // Background that ignores bottom safe area (red)
        VStackNode {
          SpacerNode()

          ColorNode("#FF0000:#FF453A")
            .frame(height: 100)
            .ignoresSafeArea(.bottom)
        }
      }
    }
  }
}
