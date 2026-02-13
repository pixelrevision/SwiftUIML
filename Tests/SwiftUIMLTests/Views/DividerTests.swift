//
//  DividerTests.swift
//  SwiftUIML
//
//  Divider view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class DividerTests: XCTestCase {
  @MainActor
  func testDividerBasic() {
    testNode(TestCase.view.divider.basic, size: CGSize(width: 100, height: 100)) {
      VStackNode {
        TextNode("Top")
        DividerNode()
        TextNode("Bottom")
      }
      .padding(10)
      .background(ColorNode("#FFFFFF:#1C1C1E"))
    }
  }
}
