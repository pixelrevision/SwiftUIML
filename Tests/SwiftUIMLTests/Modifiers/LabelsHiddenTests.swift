//
//  LabelsHiddenTests.swift
//  SwiftUIML
//
//  LabelsHidden modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LabelsHiddenTests: XCTestCase {
  @MainActor
  func testLabelsHiddenComparison() {
    testNode(
      TestCase.modifier.labelsHidden.comparison,
      size: CGSize(width: 300, height: 150),
      useHostingController: true
    ) {
      VStackNode(spacing: 20) {
        ProgressViewNode(label: "A label")
          .progressViewStyle(.linear)

        ProgressViewNode(label: "A label")
          .progressViewStyle(.linear)
          .labelsHidden()
      }
      .padding(20)
    }
  }
}
