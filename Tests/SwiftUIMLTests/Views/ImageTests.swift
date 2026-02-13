//
//  ImageTests.swift
//  SwiftUIML
//
//  Image view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ImageTests: XCTestCase {
  @MainActor
  func testImageSystem() {
    testNode(TestCase.view.image.system, size: CGSize(width: 50, height: 50)) {
      ImageNode(systemName: "star.fill")
    }
  }

  @MainActor
  func testImageSystemColor() {
    testNode(TestCase.view.image.systemColor, size: CGSize(width: 50, height: 50)) {
      ImageNode(systemName: "heart.fill")
        .foregroundColor("#FF0000:#FF69B4")
    }
  }

  @MainActor
  func testImageLocal() {
    let bundleId = Bundle.module.bundleIdentifier ?? ""
    testNode(TestCase.view.image.local, size: CGSize(width: 50, height: 50)) {
      ImageNode(name: "generated-image", bundle: bundleId)
        .resizable()
        .aspectRatio("1:1", contentMode: .fit)
    }
  }
}
