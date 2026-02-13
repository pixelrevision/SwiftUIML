//
//  ContainerRelativeFrameTests.swift
//  SwiftUIML
//
//  ContainerRelativeFrame modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ContainerRelativeFrameTests: XCTestCase {
  @MainActor
  func testContainerRelativeFrameHorizontal() {
    testNode(
      TestCase.modifier.containerRelativeFrame.horizontal,
      size: CGSize(width: 300, height: 100),
      useHostingController: true
    ) {
      HStackNode(spacing: 0) {
        ColorNode("#FF3B30:#FF453A")
          .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0)
        ColorNode("#34C759:#30D158")
          .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0)
        ColorNode("#007AFF:#0A84FF")
          .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0)
      }
    }
  }

  @MainActor
  func testContainerRelativeFrameVertical() {
    testNode(
      TestCase.modifier.containerRelativeFrame.vertical,
      size: CGSize(width: 100, height: 300),
      useHostingController: true
    ) {
      VStackNode(spacing: 0) {
        ColorNode("#FF3B30:#FF453A")
          .containerRelativeFrame(.vertical, count: 3, span: 1, spacing: 0)
        ColorNode("#34C759:#30D158")
          .containerRelativeFrame(.vertical, count: 3, span: 1, spacing: 0)
        ColorNode("#007AFF:#0A84FF")
          .containerRelativeFrame(.vertical, count: 3, span: 1, spacing: 0)
      }
    }
  }

  @MainActor
  func testContainerRelativeFrameBoth() {
    testNode(
      TestCase.modifier.containerRelativeFrame.both,
      size: CGSize(width: 200, height: 200),
      useHostingController: true
    ) {
      VStackNode(spacing: 0) {
        HStackNode(spacing: 0) {
          ColorNode("#FF3B30:#FF453A")
            .containerRelativeFrame(.both, count: 2, span: 1, spacing: 0)
          ColorNode("#34C759:#30D158")
            .containerRelativeFrame(.both, count: 2, span: 1, spacing: 0)
        }
        HStackNode(spacing: 0) {
          ColorNode("#007AFF:#0A84FF")
            .containerRelativeFrame(.both, count: 2, span: 1, spacing: 0)
          ColorNode("#FF9500:#FF9F0A")
            .containerRelativeFrame(.both, count: 2, span: 1, spacing: 0)
        }
      }
    }
  }

  @MainActor
  func testContainerRelativeFrameSpanMultiple() {
    testNode(
      TestCase.modifier.containerRelativeFrame.spanMultiple,
      size: CGSize(width: 400, height: 100),
      useHostingController: true
    ) {
      HStackNode(spacing: 0) {
        ColorNode("#FF3B30:#FF453A")
          .containerRelativeFrame(.horizontal, count: 4, span: 3, spacing: 0)
        ColorNode("#34C759:#30D158")
          .containerRelativeFrame(.horizontal, count: 4, span: 1, spacing: 0)
      }
    }
  }

  @MainActor
  func testContainerRelativeFrameWithSpacing() {
    testNode(
      TestCase.modifier.containerRelativeFrame.withSpacing,
      size: CGSize(width: 300, height: 100),
      useHostingController: true
    ) {
      HStackNode(spacing: 0) {
        ColorNode("#FF3B30:#FF453A")
          .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 10)
        ColorNode("#34C759:#30D158")
          .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 10)
        ColorNode("#007AFF:#0A84FF")
          .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 10)
      }
    }
  }

  @MainActor
  func testContainerRelativeFrameAlignment() {
    testNode(
      TestCase.modifier.containerRelativeFrame.alignment,
      size: CGSize(width: 300, height: 100),
      useHostingController: true
    ) {
      HStackNode(spacing: 0) {
        TextNode("Top")
          .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0, alignment: .top)
          .background(ColorNode("#FF3B30:#FF453A"))
        TextNode("Center")
          .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0, alignment: .center)
          .background(ColorNode("#34C759:#30D158"))
        TextNode("Bottom")
          .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0, alignment: .bottom)
          .background(ColorNode("#007AFF:#0A84FF"))
      }
    }
  }

  @MainActor
  func testContainerRelativeFrameComplexLayout() {
    testNode(
      TestCase.modifier.containerRelativeFrame.complexLayout,
      size: CGSize(width: 400, height: 300),
      useHostingController: true
    ) {
      VStackNode(spacing: 0) {
        // Header spanning full width
        ColorNode("#FF3B30:#FF453A")
          .containerRelativeFrame(.horizontal, count: 12, span: 12, spacing: 0)
          .frame(height: 50)

        HStackNode(spacing: 0) {
          // Sidebar
          ColorNode("#34C759:#30D158")
            .containerRelativeFrame(.horizontal, count: 12, span: 3, spacing: 0)

          // Main content
          ColorNode("#007AFF:#0A84FF")
            .containerRelativeFrame(.horizontal, count: 12, span: 9, spacing: 0)
        }
      }
    }
  }
}
