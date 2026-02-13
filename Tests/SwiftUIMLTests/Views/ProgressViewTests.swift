//
//  ProgressViewTests.swift
//  SwiftUIML
//
//  ProgressView view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class ProgressViewTests: XCTestCase {
  @MainActor
  func testProgressViewPercentageBased() {
    testNode(
      TestCase.view.progressView.percentageBased,
      size: CGSize(width: 150, height: 70),
      useHostingController: true
    ) {
      ProgressViewNode(label: "Progress", value: 0.65, total: 1.0)
        .tint("#FF375F")
    }
  }
}
