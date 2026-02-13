//
//  SectionTests.swift
//  SwiftUIML
//
//  Section view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class SectionTests: XCTestCase {
  @MainActor
  func testSectionBasic() {
    testNode(TestCase.view.section.basic, size: CGSize(width: 300, height: 200), useHostingController: true) {
      ListNode {
        SectionNode {
          TextNode("Item 1")
          TextNode("Item 2")
          TextNode("Item 3")
        }
      }
    }
  }

  @MainActor
  func testSectionHeader() {
    testNode(TestCase.view.section.header, size: CGSize(width: 300, height: 250), useHostingController: true) {
      ListNode {
        SectionNode(header: TextNode("Header")) {
          TextNode("Item 1")
          TextNode("Item 2")
          TextNode("Item 3")
        }
      }
    }
  }

  @MainActor
  func testSectionFooter() {
    testNode(TestCase.view.section.footer, size: CGSize(width: 300, height: 250), useHostingController: true) {
      ListNode {
        SectionNode(footer: TextNode("Footer text")) {
          TextNode("Item 1")
          TextNode("Item 2")
        }
      }
    }
  }

  @MainActor
  func testSectionHeaderFooter() {
    testNode(TestCase.view.section.headerFooter, size: CGSize(width: 300, height: 300), useHostingController: true) {
      ListNode {
        SectionNode(header: TextNode("Section Header"), footer: TextNode("Section Footer")) {
          TextNode("Item 1")
          TextNode("Item 2")
          TextNode("Item 3")
        }
      }
    }
  }

  @MainActor
  func testSectionMultiple() {
    testNode(TestCase.view.section.multiple, size: CGSize(width: 300, height: 350), useHostingController: true) {
      ListNode {
        SectionNode(header: TextNode("First Section")) {
          TextNode("Item 1")
          TextNode("Item 2")
        }

        SectionNode(header: TextNode("Second Section")) {
          TextNode("Item 3")
          TextNode("Item 4")
        }
      }
    }
  }
}
