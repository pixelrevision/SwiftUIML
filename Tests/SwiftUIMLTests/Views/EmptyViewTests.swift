//
//  EmptyViewTests.swift
//  SwiftUIML
//
//  EmptyView view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class EmptyViewTests: XCTestCase {
  @MainActor
  func testEmptyViewSpacing() {
    testNode(TestCase.view.emptyView.spacing, size: CGSize(width: 250, height: 250)) {
      VStackNode(spacing: 0, alignment: .leading) {
        TextNode("Section 1")
          .font(.headline)

        EmptyViewNode()
          .frame(height: 20)

        TextNode("Content for section 1")
          .font(.body)

        EmptyViewNode()
          .frame(height: 30)

        TextNode("Section 2")
          .font(.headline)

        EmptyViewNode()
          .frame(height: 20)

        TextNode("Content for section 2")
          .font(.body)
      }
      .padding(20)
    }
  }
}
