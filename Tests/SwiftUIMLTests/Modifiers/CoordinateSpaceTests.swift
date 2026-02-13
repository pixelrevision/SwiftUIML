//
//  CoordinateSpaceTests.swift
//  SwiftUIML
//
//  CoordinateSpace modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class CoordinateSpaceTests: XCTestCase {
  // Note: coordinateSpace is primarily used for GeometryReader and position calculations.
  // The visual effect is not directly observable in snapshots, but we can verify it applies.

  @MainActor
  func testCoordinateSpaceBasic() {
    testNode(TestCase.modifier.coordinateSpace.basic, size: CGSize(width: 220, height: 220)) {
      ZStackNode(alignment: .topLeading) {
        ColorNode("blue")
          .frame(width: 200, height: 200)
          .coordinateSpace("container")

        TextNode("Content")
          .font(size: 18)
          .padding(20)
          .backgroundColor("white")
          .cornerRadius(8)
      }
    }
  }

  @MainActor
  func testCoordinateSpaceMultiple() {
    testNode(TestCase.modifier.coordinateSpace.multiple, size: CGSize(width: 200, height: 400)) {
      VStackNode(spacing: 20) {
        ZStackNode {
          ColorNode("red")
            .frame(width: 150, height: 100)
            .coordinateSpace("redSpace")

          TextNode("Red Space")
            .foregroundColor("white")
        }

        ZStackNode {
          ColorNode("green")
            .frame(width: 150, height: 100)
            .coordinateSpace("greenSpace")

          TextNode("Green Space")
            .foregroundColor("white")
        }

        ZStackNode {
          ColorNode("blue")
            .frame(width: 150, height: 100)
            .coordinateSpace("blueSpace")

          TextNode("Blue Space")
            .foregroundColor("white")
        }
      }
    }
  }
}
