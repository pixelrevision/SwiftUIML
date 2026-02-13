//
//  BadgeTests.swift
//  SwiftUIML
//
//  Badge modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class BadgeTests: XCTestCase {
  @MainActor
  func testBadgeString() {
    testNode(TestCase.modifier.badge.string, size: CGSize(width: 320, height: 300), useHostingController: true) {
      ListNode {
        TextNode("Inbox")
          .badge("99+")
        TextNode("Drafts")
          .badge("New")
        TextNode("Sent")
        TextNode("Archive")
          .badge("!")
      }
      .listStyle(.insetGrouped)
    }
  }

  @MainActor
  func testBadgeInteger() {
    testNode(TestCase.modifier.badge.integer, size: CGSize(width: 320, height: 300), useHostingController: true) {
      ListNode {
        TextNode("Messages")
          .badge(42)
        TextNode("Notifications")
          .badge(3)
        TextNode("Updates")
          .badge(0)
        TextNode("Settings")
      }
      .listStyle(.insetGrouped)
    }
  }

  @MainActor
  func testBadgeMixed() {
    testNode(TestCase.modifier.badge.mixed, size: CGSize(width: 320, height: 300), useHostingController: true) {
      ListNode {
        TextNode("High Priority")
          .badge("!")
        TextNode("Inbox")
          .badge(15)
        TextNode("Drafts")
          .badge("Draft")
        TextNode("Archive")
      }
      .listStyle(.insetGrouped)
    }
  }
}
