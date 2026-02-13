//
//  MenuTests.swift
//  SwiftUIML
//
//  Menu view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class MenuTests: XCTestCase {
  @MainActor
  func testMenuBasic() {
    testNode(TestCase.view.menu.basic, size: CGSize(width: 220, height: 100), useHostingController: true) {
      VStackNode(spacing: 16) {
        MenuNode("Actions") {
          ButtonNode("Paste", onTap: "paste")
          ButtonNode("Delete", onTap: "delete")
        }
        
        MenuNode("Share") {
          ButtonNode("Email", onTap: "email")
          ButtonNode("Messages", onTap: "messages")
          ButtonNode("AirDrop", onTap: "airdrop")
        }
      }
      .padding()
    }
  }
}
