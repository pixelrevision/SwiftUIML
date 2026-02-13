//
//  LinearGradientTests.swift
//  SwiftUIML
//
//  LinearGradient view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class LinearGradientTests: XCTestCase {
  @MainActor
  func testLinearGradientBasic() {
    testNode(TestCase.view.linearGradient.basic, size: CGSize(width: 100, height: 100)) {
      LinearGradientNode(
        colors: ["#FF0000", "#00FF00", "#0000FF", "#FF0000"]
      )
    }
  }

  @MainActor
  func testLinearGradientConditional() {
    testNode(TestCase.view.linearGradient.conditional, size: CGSize(width: 100, height: 100)) {
      LinearGradientNode(
        colors: ["#FFFFFF:#000000", "#CCCCCC:#5C5B5B"]
      )
    }
  }

  @MainActor
  func testLinearGradientLeadingTrailing() {
    testNode(TestCase.view.linearGradient.leadingTrailing, size: CGSize(width: 100, height: 100)) {
      LinearGradientNode(
        colors: ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
        startPoint: .leading,
        endPoint: .trailing
      )
    }
  }

  @MainActor
  func testLinearGradientAlpha() {
    testNode(TestCase.view.linearGradient.alpha, size: CGSize(width: 100, height: 100)) {
      LinearGradientNode(
        colors: ["#FF000080", "#00FF0080", "#0000FF80", "#FF000080"]
      )
    }
  }
}
