//
//  ShareLinkTests.swift
//  SwiftUIML
//
//  ShareLink view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ShareLinkTests: XCTestCase {
  @MainActor
  func testShareLinkBasic() {
    testNode(TestCase.view.shareLink.basic, size: CGSize(width: 150, height: 80)) {
      ShareLinkNode(url: "https://apple.com")
    }
  }

  @MainActor
  func testShareLinkWithTitle() {
    testNode(TestCase.view.shareLink.withTitle, size: CGSize(width: 200, height: 80)) {
      ShareLinkNode("Share this link", url: "https://apple.com")
    }
  }

  @MainActor
  func testShareLinkStyled() {
    testNode(TestCase.view.shareLink.styled, size: CGSize(width: 250, height: 200)) {
      VStackNode(spacing: 15, alignment: .leading) {
        ShareLinkNode("Default", url: "https://example.com")

        ShareLinkNode("Styled Link", url: "https://example.com")
          .font(.title3)
          .foregroundColor("#007AFF")

        ShareLinkNode("Large", url: "https://example.com")
          .font(.title)
          .bold()
      }
      .padding(20)
    }
  }
}
