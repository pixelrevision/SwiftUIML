//
//  ResizableTests.swift
//  SwiftUIML
//
//  Resizable modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ResizableTests: XCTestCase {
  @MainActor
  func testResizableBasic() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.resizable.basic, size: CGSize(width: 300, height: 180)) {
      HStackNode(spacing: 24) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .frame(width: 100, height: 100)

          TextNode("Not Resizable")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 100, height: 100)

          TextNode("Resizable")
            .font(.caption)
        }
      }
    }
  }

  @MainActor
  func testResizableAspectFit() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.resizable.aspectFit, size: CGSize(width: 300, height: 200)) {
      HStackNode(spacing: 24) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .frame(width: 100, height: 120)
            .background(ColorNode("#F0F0F0"))

          TextNode("Aspect Fit")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .aspectRatio(1.0, contentMode: .fill)
            .frame(width: 100, height: 120)
            .clipped()
            .background(ColorNode("#F0F0F0"))

          TextNode("Aspect Fill")
            .font(.caption)
        }
      }
    }
  }

  @MainActor
  func testResizableSymbol() {
    testNode(TestCase.modifier.resizable.symbol, size: CGSize(width: 300, height: 200)) {
      HStackNode(spacing: 24) {
        VStackNode(spacing: 8) {
          ImageNode(systemName: "star.fill")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor("#FF9500")

          TextNode("60x60")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          ImageNode(systemName: "heart.fill")
            .resizable()
            .frame(width: 80, height: 80)
            .foregroundColor("#FF3B30")

          TextNode("80x80")
            .font(.caption)
        }
      }
    }
  }

  @MainActor
  func testResizableDifferentSizes() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.modifier.resizable.differentSizes, size: CGSize(width: 350, height: 180)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 50, height: 50)

          TextNode("50x50")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 80, height: 80)

          TextNode("80x80")
            .font(.caption)
        }

        VStackNode(spacing: 8) {
          ImageNode(name: "generated-image", bundle: bundleId)
            .resizable()
            .frame(width: 120, height: 120)

          TextNode("120x120")
            .font(.caption)
        }
      }
    }
  }
}
