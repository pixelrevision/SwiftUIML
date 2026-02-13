//
//  OverlayTests.swift
//  SwiftUIML
//
//  Overlay modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class OverlayTests: XCTestCase {
  @MainActor
  func testOverlayCentered() {
    testNode(TestCase.modifier.overlay.centered, size: CGSize(width: 120, height: 120)) {
      ColorNode("#007AFF33:#0A84FF33")
        .frame(width: 100, height: 100)
        .overlay(
          TextNode("Overlay")
            .padding(8)
            .background(ColorNode("#000000BB:#FFFFFFBB"))
            .cornerRadius(6)
        )
    }
  }

  @MainActor
  func testOverlayTopLeading() {
    testNode(TestCase.modifier.overlay.topLeading, size: CGSize(width: 120, height: 120)) {
      ColorNode("#007AFF33:#0A84FF33")
        .frame(width: 100, height: 100)
        .overlay(
          CircleNode()
            .fill("#FF3B30:#FF453A")
            .frame(width: 20, height: 20),
          alignment: .topLeading
        )
    }
  }

  @MainActor
  func testOverlayBottomTrailing() {
    testNode(TestCase.modifier.overlay.bottomTrailing, size: CGSize(width: 120, height: 120)) {
      ColorNode("#34C75933:#30D15833")
        .frame(width: 100, height: 100)
        .overlay(
          CircleNode()
            .fill("#FF9500:#FF9F0A")
            .frame(width: 20, height: 20),
          alignment: .bottomTrailing
        )
    }
  }

  @MainActor
  func testOverlayIcon() {
    testNode(TestCase.modifier.overlay.icon, size: CGSize(width: 100, height: 100)) {
      RoundedRectangleNode(cornerRadius: 12)
        .fill("#5856D633:#5E5CE633")
        .frame(width: 80, height: 80)
        .overlay(
          ImageNode(systemName: "star.fill")
            .foregroundColor("#FFD60A:#FFD60A")
        )
    }
  }
}
