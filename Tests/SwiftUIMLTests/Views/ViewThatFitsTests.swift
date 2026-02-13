//
//  ViewThatFitsTests.swift
//  SwiftUIML
//
//  ViewThatFits view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ViewThatFitsTests: XCTestCase {
  @MainActor
  func testViewThatFitsHorizontal() {
    testNode(TestCase.view.viewThatFits.horizontal, size: CGSize(width: 350, height: 60)) {
      HStackNode(spacing: 5) {
        // Wide container - should show "Long"
        ViewThatFitsNode(axis: .horizontal) {
          TextNode("Long")
            .frame(minWidth: 150)
          TextNode("Medium")
            .frame(minWidth: 100)
          TextNode("Short")
            .frame(minWidth: 50)
        }
        .frame(width: 160, height: 40)
        .backgroundColor("#FF375F:#FF6482")

        // Medium container - should show "Medium"
        ViewThatFitsNode(axis: .horizontal) {
          TextNode("Long")
            .frame(minWidth: 150)
          TextNode("Medium")
            .frame(minWidth: 100)
          TextNode("Short")
            .frame(minWidth: 50)
        }
        .frame(width: 110, height: 40)
        .backgroundColor("#34C759:#30D158")

        // Narrow container - should show "Short"
        ViewThatFitsNode(axis: .horizontal) {
          TextNode("Long")
            .frame(minWidth: 150)
          TextNode("Medium")
            .frame(minWidth: 100)
          TextNode("Short")
            .frame(minWidth: 50)
        }
        .frame(width: 60, height: 40)
        .backgroundColor("#007AFF:#0A84FF")
      }
    }
  }

  @MainActor
  func testViewThatFitsVertical() {
    testNode(TestCase.view.viewThatFits.vertical, size: CGSize(width: 120, height: 350)) {
      VStackNode(spacing: 5) {
        // Tall container - should show "Tall"
        ViewThatFitsNode(axis: .vertical) {
          TextNode("Tall")
            .frame(minHeight: 150)
          TextNode("Medium")
            .frame(minHeight: 100)
          TextNode("Short")
            .frame(minHeight: 50)
        }
        .frame(width: 100, height: 160)
        .backgroundColor("#FF375F:#FF6482")

        // Medium container - should show "Medium"
        ViewThatFitsNode(axis: .vertical) {
          TextNode("Tall")
            .frame(minHeight: 150)
          TextNode("Medium")
            .frame(minHeight: 100)
          TextNode("Short")
            .frame(minHeight: 50)
        }
        .frame(width: 100, height: 110)
        .backgroundColor("#34C759:#30D158")

        // Short container - should show "Short"
        ViewThatFitsNode(axis: .vertical) {
          TextNode("Tall")
            .frame(minHeight: 150)
          TextNode("Medium")
            .frame(minHeight: 100)
          TextNode("Short")
            .frame(minHeight: 50)
        }
        .frame(width: 100, height: 60)
        .backgroundColor("#007AFF:#0A84FF")
      }
    }
  }
}
