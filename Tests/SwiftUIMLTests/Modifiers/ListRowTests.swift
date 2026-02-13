//
//  ListRowTests.swift
//  SwiftUIML
//
//  ListRow modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ListRowTests: XCTestCase {
  @MainActor
  func testListRowBackground() {
    testNode(TestCase.modifier.listRow.background, size: CGSize(width: 300, height: 250), useHostingController: true) {
      ListNode {
        TextNode("Row 1")
          .listRowBackground(ColorNode("#FF3B30:#FF453A"))

        TextNode("Row 2")
          .listRowBackground(ColorNode("#34C759:#30D158"))

        TextNode("Row 3")
          .listRowBackground(ColorNode("#007AFF:#0A84FF"))
      }
      .listStyle(.insetGrouped)
      .frame(width: 300, height: 250)
    }
  }

  @MainActor
  func testListRowInsets() {
    testNode(TestCase.modifier.listRow.insets, size: CGSize(width: 300, height: 250), useHostingController: true) {
      ListNode {
        TextNode("Default")
          .listRowBackground(ColorNode("#E5E5EA:#636366"))

        TextNode("Custom (40L, 20T/B)")
          .listRowBackground(ColorNode("#D1D1D6:#48484A"))
          .listRowInsets(top: 20, leading: 40, bottom: 20, trailing: 40)

        TextNode("Zero")
          .listRowBackground(ColorNode("#AEAEB2:#3A3A3C"))
          .listRowInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
      }
      .listStyle(.insetGrouped)
      .frame(width: 300, height: 250)
    }
  }

  @MainActor
  func testListRowSeparator() {
    testNode(TestCase.modifier.listRow.separator, size: CGSize(width: 300, height: 250), useHostingController: true) {
      ListNode {
        TextNode("Automatic")
          .listRowSeparator(visibility: .automatic)

        TextNode("Visible")
          .listRowSeparator(visibility: .visible)

        TextNode("Hidden")
          .listRowSeparator(visibility: .hidden)

        TextNode("Normal")
      }
      .listStyle(.insetGrouped)
      .frame(width: 300, height: 250)
    }
  }
}
