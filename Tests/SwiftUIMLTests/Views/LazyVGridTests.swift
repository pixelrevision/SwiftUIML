//
//  LazyVGridTests.swift
//  SwiftUIML
//
//  LazyVGrid view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LazyVGridTests: XCTestCase {
  @MainActor
  func testLazyVGridBasic() {
    testNode(TestCase.view.lazyVGrid.basic, size: CGSize(width: 400, height: 500), useHostingController: true) {
      ScrollViewNode {
        LazyVGridNode(columns: 3, spacing: 10) {
          ForEachNode(0..<12) { i in
            RoundedRectangleNode(cornerRadius: 8)
              .fill(ColorNode("#007AFF:#0A84FF"))
              .frame(height: 80)
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
  func testLazyVGridAlignment() {
    testNode(TestCase.view.lazyVGrid.alignment, size: CGSize(width: 400, height: 400), useHostingController: true) {
      ScrollViewNode {
        LazyVGridNode(columns: 2, alignment: .leading, spacing: 12) {
          ForEachNode(0..<6) { i in
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
