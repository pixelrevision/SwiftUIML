//
//  ToolbarTests.swift
//  SwiftUIML
//
//  Toolbar modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ToolbarTests: XCTestCase {
  @MainActor
  func testToolbarWithButtons() {
    testNode(TestCase.modifier.toolbar.withButtons, size: CGSize(width: 350, height: 150), useHostingController: true) {
      NavigationStackNode {
        VStackNode(spacing: 20) {
          TextNode("Content with Toolbar")
            .font(size: 24)
        }
        .toolbar {
          ButtonNode(action: "add") {
            ImageNode(systemName: "plus")
          }
          ButtonNode(action: "edit") {
            ImageNode(systemName: "pencil")
          }
        }
      }
    }
  }
}
