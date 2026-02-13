//
//  RedactedTests.swift
//  SwiftUIML
//
//  Redacted modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class RedactedTests: XCTestCase {
  @MainActor
  func testRedactedPlaceholder() {
    testNode(TestCase.modifier.redacted.placeholder, size: CGSize(width: 320, height: 200)) {
      VStackNode(spacing: 20) {
        TextNode("Normal Text")
          .font(.title)

        TextNode("Loading Content...")
          .font(.title)
          .redacted(reason: .placeholder)

        HStackNode(spacing: 10) {
          CircleNode()
            .fill("#3498DB:#0A84FF")
            .frame(width: 50, height: 50)
            .redacted(reason: .placeholder)

          VStackNode(alignment: .leading) {
            TextNode("User Name")
              .font(.headline)
            TextNode("user@example.com")
              .font(.caption)
          }
          .redacted(reason: .placeholder)
        }
      }
      .padding()
    }
  }
}
