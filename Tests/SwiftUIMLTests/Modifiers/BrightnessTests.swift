//
//  BrightnessTests.swift
//  SwiftUIML
//
//  Brightness modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class BrightnessTests: XCTestCase {
  @MainActor
  func testBrightnessVariations() {
    testNode(TestCase.modifier.brightness.variations, size: CGSize(width: 300, height: 200)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          ColorNode("#007AFF:#0A84FF")
            .frame(width: 60, height: 60)
          TextNode("-0.5")
            .font(size: 12)
        }
        .brightness(-0.5)

        VStackNode(spacing: 8) {
          ColorNode("#007AFF:#0A84FF")
            .frame(width: 60, height: 60)
          TextNode("0.0")
            .font(size: 12)
        }
        .brightness(0.0)

        VStackNode(spacing: 8) {
          ColorNode("#007AFF:#0A84FF")
            .frame(width: 60, height: 60)
          TextNode("0.5")
            .font(size: 12)
        }
        .brightness(0.5)

        VStackNode(spacing: 8) {
          ColorNode("#007AFF:#0A84FF")
            .frame(width: 60, height: 60)
          TextNode("1.0")
            .font(size: 12)
        }
        .brightness(1.0)
      }
    }
  }

  @MainActor
  func testBrightnessOnImage() {
    testNode(TestCase.modifier.brightness.onImage, size: CGSize(width: 250, height: 100)) {
      HStackNode(spacing: 16) {
        ImageNode(systemName: "star.fill")
          .resizable()
          .foregroundColor("#FFD60A:#FFD60A")
          .frame(width: 50, height: 50)
          .brightness(-0.3)

        ImageNode(systemName: "star.fill")
          .resizable()
          .foregroundColor("#FFD60A:#FFD60A")
          .frame(width: 50, height: 50)

        ImageNode(systemName: "star.fill")
          .resizable()
          .foregroundColor("#FFD60A:#FFD60A")
          .frame(width: 50, height: 50)
          .brightness(0.3)
      }
    }
  }
}
