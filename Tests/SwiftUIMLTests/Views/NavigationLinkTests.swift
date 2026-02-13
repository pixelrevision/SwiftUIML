//
//  NavigationLinkTests.swift
//  SwiftUIML
//
//  NavigationLink view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class NavigationLinkTests: XCTestCase {
  @MainActor
  func testNavigationLinkBasic() {
    testNode(TestCase.view.navigationLink.basic, size: CGSize(width: 280, height: 150), useHostingController: true) {
      NavigationStackNode {
        VStackNode(spacing: 16) {
          NavigationLinkNode("Go to Profile", value: "profile")
            .padding()
        }
        .padding()
      }
    }
  }
}
