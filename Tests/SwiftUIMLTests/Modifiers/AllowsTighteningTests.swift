//
//  AllowsTighteningTests.swift
//  SwiftUIML
//
//  AllowsTightening modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class AllowsTighteningTests: XCTestCase {
  // Note: allowsTightening has an extremely subtle visual effect that reduces
  // inter-character spacing slightly when text is constrained. The effect is
  // typically imperceptible in snapshots, so we just verify the modifier applies.

  @MainActor
  func testAllowsTighteningBasic() {
    testNode(TestCase.modifier.allowsTightening.basic, size: CGSize(width: 240, height: 200)) {
      VStackNode(spacing: 20) {
        TextNode("Text with tightening enabled")
          .font(size: 18)
          .frame(width: 200)
          .lineLimit(1)
          .allowsTightening(true)
          .border("blue", width: 1)

        TextNode("Text with tightening disabled")
          .font(size: 18)
          .frame(width: 200)
          .lineLimit(1)
          .allowsTightening(false)
          .border("red", width: 1)

        TextNode("Text with default behavior")
          .font(size: 18)
          .frame(width: 200)
          .lineLimit(1)
          .border("gray", width: 1)
      }
    }
  }
}
