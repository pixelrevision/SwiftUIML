//
//  ClipShapeTests.swift
//  SwiftUIML
//
//  ClipShape modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ClipShapeTests: XCTestCase {
  @MainActor
  func testClipShapeCircle() {
    testNode(TestCase.modifier.clipShape.circle, size: CGSize(width: 100, height: 100)) {
      ImageNode(systemName: "star.fill")
        .resizable()
        .foregroundColor("#FFD60A:#FFD60A")
        .frame(width: 80, height: 80)
        .clipShape(
          CircleNode()
            .frame(width: 50, height: 50)
        )
    }
  }

  @MainActor
  func testClipShapeCapsule() {
    testNode(TestCase.modifier.clipShape.capsule, size: CGSize(width: 120, height: 80)) {
      ColorNode("#007AFF:#0A84FF")
        .frame(width: 100, height: 60)
        .overlay(
          TextNode("Clipped")
            .foregroundColor("#FFFFFF:#000000")
        )
        .clipShape(CapsuleNode())
    }
  }
}
