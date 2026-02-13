//
//  RadialGradientTests.swift
//  SwiftUIML
//
//  RadialGradient view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class RadialGradientTests: XCTestCase {
  @MainActor
  func testRadialGradientBasic() {
    testNode(TestCase.view.radialGradient.basic, size: CGSize(width: 100, height: 100)) {
      RadialGradientNode(
        colors: ["#FF0000", "#00FF00", "#0000FF", "#FF0000"]
      )
    }
  }

  @MainActor
  func testRadialGradientConditional() {
    testNode(TestCase.view.radialGradient.conditional, size: CGSize(width: 100, height: 100)) {
      RadialGradientNode(
        colors: ["#FFFFFF:#000000", "#CCCCCC:#5C5B5B"]
      )
    }
  }

  @MainActor
  func testRadialGradientTopLeading() {
    testNode(TestCase.view.radialGradient.topLeading, size: CGSize(width: 100, height: 100)) {
      RadialGradientNode(
        colors: ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
        center: .topLeading
      )
    }
  }

  @MainActor
  func testRadialGradientBottomTrailing() {
    testNode(TestCase.view.radialGradient.bottomTrailing, size: CGSize(width: 100, height: 100)) {
      RadialGradientNode(
        colors: ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
        center: .bottomTrailing
      )
    }
  }

  @MainActor
  func testRadialGradientAlpha() {
    testNode(TestCase.view.radialGradient.alpha, size: CGSize(width: 100, height: 100)) {
      RadialGradientNode(
        colors: ["#FF000080", "#00FF0080", "#0000FF80", "#FF000080"]
      )
    }
  }
}
