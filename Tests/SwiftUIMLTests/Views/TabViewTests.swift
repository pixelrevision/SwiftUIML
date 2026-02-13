//
//  TabViewTests.swift
//  SwiftUIML
//
//  TabView view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class TabViewTests: XCTestCase {
  @MainActor
  func testTabViewBasic() {
    testNode(TestCase.view.tabView.basic, size: CGSize(width: 300, height: 200), useHostingController: true) {
      TabViewNode {
        VStackNode(spacing: 16) {
          TextNode("Tab 1 Contents")
        }
        .tabItem([
          .systemName: "house.fill",
          .text: "Home",
        ])
        .tag("home")

        VStackNode(spacing: 16) {
          TextNode("Tab 2 Contents")
        }
        .tabItem([
          .systemName: "magnifyingglass",
          .text: "Search",
        ])
        .tag("search")

        VStackNode(spacing: 16) {
          TextNode("Tab 3 Contents")
        }
        .tabItem([
          .systemName: "person.fill",
          .text: "Profile",
        ])
        .tag("profile")
      }
      .tint("red")
    }
  }
}
