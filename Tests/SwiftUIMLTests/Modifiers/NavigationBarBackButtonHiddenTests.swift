//
//  NavigationBarBackButtonHiddenTests.swift
//  SwiftUIML
//
//  navigationBarBackButtonHidden modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class NavigationBarBackButtonHiddenTests: XCTestCase {
  @MainActor
  func testNavigationBarBackButtonHiddenTrue() {
    testNode(
      TestCase.modifier.navigationBarBackButtonHidden.true,
      size: CGSize(width: 375, height: 200),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Home Screen")
            .font(.body)
        }
        .padding()
        .navigationDestination(value: "detail", isPresented: true) {
          VStackNode(spacing: 16) {
            TextNode("Detail View")
              .font(.title)
            TextNode("Back button is hidden")
              .font(.caption)
              .foregroundColor("#8E8E93:#8E8E93")
          }
          .padding()
          .navigationBarBackButtonHidden(true)
          .navigationTitle("Details")
        }
      }
      .navigationTitle("Home")
    }
  }

  @MainActor
  func testNavigationBarBackButtonHiddenFalse() {
    testNode(
      TestCase.modifier.navigationBarBackButtonHidden.false,
      size: CGSize(width: 375, height: 200),
      useHostingController: true
    ) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          TextNode("Home Screen")
            .font(.body)
        }
        .padding()
        .navigationDestination(value: "detail", isPresented: true) {
          VStackNode(spacing: 16) {
            TextNode("Detail View")
              .font(.title)
            TextNode("Back button is visible")
              .font(.caption)
              .foregroundColor("#8E8E93:#8E8E93")
          }
          .padding()
          .navigationBarBackButtonHidden(false)
          .navigationTitle("Details")
        }
      }
      .navigationTitle("Home")
    }
  }
}
