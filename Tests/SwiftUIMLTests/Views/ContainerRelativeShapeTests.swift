//
//  ContainerRelativeShapeTests.swift
//  SwiftUIML
//
//  ContainerRelativeShape view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ContainerRelativeShapeTests: XCTestCase {
  @MainActor
  func testStrokedContainerRelativeShapeWithFill() {
    testNode(TestCase.view.containerRelativeShape.filledAndStroked, size: CGSize(width: 60, height: 60)) {
      ZStackNode {
        ContainerRelativeShapeNode()
          .foregroundColor("#34C75980")
        ContainerRelativeShapeNode()
          .stroke("#34C759", lineWidth: 3)
      }
    }
  }
}
