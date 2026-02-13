//
//  LinkTests.swift
//  SwiftUIML
//
//  Link view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LinkTests: XCTestCase {
  @MainActor
  func testLinkBasic() {
    testNode(TestCase.view.link.basic, size: CGSize(width: 200, height: 100)) {
      LinkNode("Visit Apple", url: "https://apple.com")
    }
  }

  @MainActor
  func testLinkWithCustomLabel() {
    testNode(TestCase.view.link.customLabel, size: CGSize(width: 200, height: 100)) {
      LinkNode(url: "https://github.com") {
        HStackNode(spacing: 8) {
          ImageNode(systemName: "link")
          TextNode("GitHub")
        }
      }
    }
  }

  @MainActor
  func testLinkStyled() {
    testNode(TestCase.view.link.styled, size: CGSize(width: 250, height: 200)) {
      VStackNode(spacing: 15, alignment: .leading) {
        LinkNode("Default Link", url: "https://example.com")

        LinkNode("Styled Link", url: "https://example.com")
          .font(.title3)
          .foregroundColor("#007AFF")

        LinkNode("Large Link", url: "https://example.com")
          .font(.title)
          .bold()
      }
      .padding(20)
    }
  }

  @MainActor
  func testLinkWithIcon() {
    testNode(TestCase.view.link.withIcon, size: CGSize(width: 200, height: 100)) {
      LinkNode(url: "https://apple.com") {
        HStackNode(spacing: 6) {
          TextNode("Apple")
          ImageNode(systemName: "arrow.up.right.square")
            .font(.caption)
        }
      }
    }
  }
}
