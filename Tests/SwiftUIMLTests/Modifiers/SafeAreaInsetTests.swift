//
//  SafeAreaInsetTests.swift
//  SwiftUIML
//
//  SafeAreaInset modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class SafeAreaInsetTests: XCTestCase {
  @MainActor
  func testSafeAreaInsetTop() {
    testNode(TestCase.modifier.safeAreaInset.top, size: CGSize(width: 300, height: 400)) {
      ColorNode("blue")
        .ignoresSafeArea()
        .safeAreaInset(
          edge: .top,
          content: HStackNode {
            TextNode("Top Inset")
              .foregroundColor("white")
              .padding(10)
          }
          .backgroundColor("red")
        )
    }
  }

  @MainActor
  func testSafeAreaInsetBottom() {
    testNode(TestCase.modifier.safeAreaInset.bottom, size: CGSize(width: 300, height: 400)) {
      ColorNode("green")
        .ignoresSafeArea()
        .safeAreaInset(
          edge: .bottom,
          content: HStackNode {
            TextNode("Bottom Inset")
              .foregroundColor("white")
              .padding(10)
          }
          .backgroundColor("purple")
        )
    }
  }

  @MainActor
  func testSafeAreaInsetMultiple() {
    testNode(TestCase.modifier.safeAreaInset.multiple, size: CGSize(width: 300, height: 400)) {
      ColorNode("yellow")
        .ignoresSafeArea()
        .safeAreaInset(
          edge: .top,
          content: TextNode("Top")
            .foregroundColor("white")
            .padding(10)
            .backgroundColor("red")
        )
        .safeAreaInset(
          edge: .bottom,
          content: TextNode("Bottom")
            .foregroundColor("white")
            .padding(10)
            .backgroundColor("blue")
        )
    }
  }
}
