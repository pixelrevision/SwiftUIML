//
//  NavigationTitleTests.swift
//  SwiftUIML
//
//  navigationTitle modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class NavigationTitleTests: XCTestCase {
  @MainActor
  func testNavigationTitleString() {
    testNode(
      TestCase.modifier.navigationTitle.string,
      size: CGSize(width: 375, height: 200),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Main Content")
            .font(.title)
          TextNode("This view has a navigation title")
            .foregroundColor("#8E8E93:#8E8E93")
        }
        .padding()
      }
      .navigationTitle("Settings")
    }
  }

  @MainActor
  func testNavigationTitleLong() {
    testNode(
      TestCase.modifier.navigationTitle.long,
      size: CGSize(width: 375, height: 200),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Content Area")
            .font(.body)
        }
        .padding()
      }
      .navigationTitle("This is a Very Long Navigation Title")
    }
  }

  @MainActor
  func testNavigationTitleEmpty() {
    testNode(
      TestCase.modifier.navigationTitle.empty,
      size: CGSize(width: 375, height: 200),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Content with Empty Title")
            .font(.body)
        }
        .padding()
      }
      .navigationTitle("")
    }
  }
}
