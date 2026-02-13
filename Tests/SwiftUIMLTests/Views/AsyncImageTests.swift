//
//  AsyncImageTests.swift
//  SwiftUIML
//
//  AsyncImage view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class AsyncImageTests: XCTestCase {
  @MainActor
  func testAsyncImageCustomEmpty() {
    testNode(TestCase.view.asyncImage.customEmpty, size: CGSize(width: 120, height: 120)) {
      AsyncImageNode(url: "https://example.com/image.jpg") {
        AsyncImageEmptyNode {
          VStackNode(spacing: 8) {
            TextNode("Loading...")
              .foregroundColor("#000000:#FFFFFF")
          }
        }
      }
      .frame(width: 100, height: 100)
    }
  }
}
