//
//  ProgressViewStyleTests.swift
//  SwiftUIML
//
//  ProgressViewStyle modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ProgressViewStyleTests: XCTestCase {
  @MainActor
  func testProgressViewStyleVariations() {
    testNode(
      TestCase.modifier.progressViewStyle.variations,
      size: CGSize(width: 300, height: 250),
      useHostingController: true
    ) {
      VStackNode(spacing: 20) {
        ProgressViewNode()
          .progressViewStyle(.automatic)

        ProgressViewNode()
          .progressViewStyle(.linear)

        ProgressViewNode()
          .progressViewStyle(.circular)
      }
      .padding(20)
    }
  }
}
