//
//  NavigationBarTitleDisplayModeModifierTests.swift
//  SwiftUIML
//
//  navigationBarTitleDisplayMode modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class NavigationBarTitleDisplayModeModifierTests: XCTestCase {
  @MainActor
  func testNavigationBarTitleDisplayModeInline() {
    testNode(
      TestCase.modifier.navigationBarTitleDisplayMode.inline,
      size: CGSize(width: 375, height: 200),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Content Area")
            .font(.body)
          TextNode("Title shown inline")
            .font(.caption)
            .foregroundColor("#8E8E93:#8E8E93")
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
      }
      .navigationTitle("Inline Title")
    }
  }

  @MainActor
  func testNavigationBarTitleDisplayModeLarge() {
    testNode(
      TestCase.modifier.navigationBarTitleDisplayMode.large,
      size: CGSize(width: 375, height: 250),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Content Area")
            .font(.body)
          TextNode("Title shown large")
            .font(.caption)
            .foregroundColor("#8E8E93:#8E8E93")
        }
        .padding()
        .navigationBarTitleDisplayMode(.large)
      }
      .navigationTitle("Large Title")
    }
  }

  @MainActor
  func testNavigationBarTitleDisplayModeAutomatic() {
    testNode(
      TestCase.modifier.navigationBarTitleDisplayMode.automatic,
      size: CGSize(width: 375, height: 250),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Content Area")
            .font(.body)
          TextNode("Title display is automatic")
            .font(.caption)
            .foregroundColor("#8E8E93:#8E8E93")
        }
        .padding()
        .navigationBarTitleDisplayMode(.automatic)
      }
      .navigationTitle("Automatic Title")
    }
  }
}
