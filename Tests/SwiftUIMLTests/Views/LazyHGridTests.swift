//
//  LazyHGridTests.swift
//  SwiftUIML
//
//  LazyHGrid view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LazyHGridTests: XCTestCase {
  @MainActor
  func testLazyHGridBasic() {
    testNode(TestCase.view.lazyHGrid.basic, size: CGSize(width: 500, height: 300), useHostingController: true) {
      ScrollViewNode(axis: .horizontal) {
        LazyHGridNode(rows: 2, spacing: 10) {
          ForEachNode(0..<12) { i in
            RoundedRectangleNode(cornerRadius: 8)
              .fill(ColorNode("#34C759:#30D158"))
              .frame(width: 120, height: 80)
              .overlay(
                TextNode("Item \(i)")
                  .foregroundColor("#FFFFFF:#000000")
                  .font(size: 16, weight: .semibold)
              )
          }
        }
        .padding(16)
      }
    }
  }

  @MainActor
  func testLazyHGridAlignment() {
    testNode(TestCase.view.lazyHGrid.alignment, size: CGSize(width: 500, height: 300), useHostingController: true) {
      ScrollViewNode(axis: .horizontal) {
        LazyHGridNode(rows: 3, alignment: .top, spacing: 8) {
          ForEachNode(0..<9) { i in
            TextNode("Item \(i)")
              .padding(12)
              .background(ColorNode("#FF9500:#FF9F0A"))
              .cornerRadius(8)
          }
        }
        .padding(16)
      }
    }
  }
}
