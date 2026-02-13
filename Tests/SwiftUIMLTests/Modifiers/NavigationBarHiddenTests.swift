//
//  NavigationBarHiddenTests.swift
//  SwiftUIML
//
//  navigationBarHidden modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class NavigationBarHiddenTests: XCTestCase {
  @MainActor
  func testNavigationBarHiddenTrue() {
    testNode(
      TestCase.modifier.navigationBarHidden.true,
      size: CGSize(width: 375, height: 200),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Full Screen Content")
            .font(.title)
          TextNode("Navigation bar is hidden")
            .font(.caption)
            .foregroundColor("#8E8E93:#8E8E93")
        }
        .padding()
        .navigationBarHidden(true)
      }
      .navigationTitle("Hidden Nav Bar")
    }
  }

  @MainActor
  func testNavigationBarHiddenFalse() {
    testNode(
      TestCase.modifier.navigationBarHidden.false,
      size: CGSize(width: 375, height: 200),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Normal Content")
            .font(.title)
          TextNode("Navigation bar is visible")
            .font(.caption)
            .foregroundColor("#8E8E93:#8E8E93")
        }
        .padding()
        .navigationBarHidden(false)
      }
      .navigationTitle("Visible Nav Bar")
    }
  }
}
