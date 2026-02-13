//
//  LabelTests.swift
//  SwiftUIML
//
//  Label view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LabelTests: XCTestCase {
  @MainActor
  func testLabelBasic() {
    testNode(TestCase.view.label.basic, size: CGSize(width: 150, height: 80)) {
      LabelNode("Home", systemImage: "house")
    }
  }

  @MainActor
  func testLabelStyled() {
    testNode(TestCase.view.label.styled, size: CGSize(width: 200, height: 200)) {
      VStackNode(spacing: 12, alignment: .leading) {
        LabelNode("Settings", systemImage: "gear")

        LabelNode("Profile", systemImage: "person.circle")
          .font(.title2)
          .foregroundColor("#007AFF:#0A84FF")

        LabelNode("Favorites", systemImage: "star.fill")
          .font(.title3)
          .bold()
      }
      .padding(20)
    }
  }

  @MainActor
  func testLabelInList() {
    testNode(TestCase.view.label.inList, size: CGSize(width: 300, height: 250), useHostingController: true) {
      ListNode {
        LabelNode("Home", systemImage: "house")
        LabelNode("Search", systemImage: "magnifyingglass")
        LabelNode("Favorites", systemImage: "star")
        LabelNode("Settings", systemImage: "gear")
      }
    }
  }
}
