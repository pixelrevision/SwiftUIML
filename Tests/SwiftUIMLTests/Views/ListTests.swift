//
//  ListTests.swift
//  SwiftUIML
//
//  List view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ListTests: XCTestCase {
  @MainActor
  func testListBasic() {
    testNode(TestCase.view.list.basic, size: CGSize(width: 300, height: 180), useHostingController: true) {
      ListNode {
        ForEachNode(1...3) { index in
          TextNode("Item \(index)")
        }
      }
    }
  }
}
