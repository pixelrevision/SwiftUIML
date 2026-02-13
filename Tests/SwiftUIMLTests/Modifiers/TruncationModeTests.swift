//
//  TruncationModeTests.swift
//  SwiftUIML
//
//  TruncationMode modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class TruncationModeTests: XCTestCase {
  @MainActor
  func testTruncationModeVariations() {
    testNode(TestCase.modifier.truncationMode.variations, size: CGSize(width: 250, height: 150)) {
      VStackNode(spacing: 20) {
        TextNode("This is a very long text that will be truncated at the tail")
          .font(size: 18)
          .frame(width: 200)
          .lineLimit(1)
          .truncationMode(.tail)
          .border("red", width: 1)

        TextNode("This is a very long text that will be truncated in the middle")
          .font(size: 18)
          .frame(width: 200)
          .lineLimit(1)
          .truncationMode(.middle)
          .border("blue", width: 1)

        TextNode("This is a very long text that will be truncated at the head")
          .font(size: 18)
          .frame(width: 200)
          .lineLimit(1)
          .truncationMode(.head)
          .border("green", width: 1)
      }
    }
  }

  @MainActor
  func testTruncationModeMultiline() {
    testNode(TestCase.modifier.truncationMode.multiline, size: CGSize(width: 220, height: 150)) {
      VStackNode(spacing: 16) {
        TextNode(
          """
          This is a long text that spans multiple lines but will be truncated at the tail when it exceeds \
          the line limit
          """
        )
          .font(size: 16)
          .frame(width: 180)
          .lineLimit(2)
          .truncationMode(.tail)
          .border("purple", width: 1)

        TextNode(
          """
          This is a long text that spans multiple lines but will be truncated in the middle when it exceeds \
          the line limit
          """
        )
          .font(size: 16)
          .frame(width: 180)
          .lineLimit(2)
          .truncationMode(.middle)
          .border("orange", width: 1)
      }
    }
  }
}
