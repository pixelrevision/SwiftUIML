//
//  AngularGradientTests.swift
//  SwiftUIML
//
//  AngularGradient view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class AngularGradientTests: XCTestCase {
  @MainActor
  func testAngularGradientBasic() {
    testNode(TestCase.view.angularGradient.basic, size: CGSize(width: 100, height: 100)) {
      AngularGradientNode(
        colors: ["#FF0000", "#00FF00", "#0000FF", "#FF0000"]
      )
    }
  }

  @MainActor
  func testAngularGradientConditional() {
    testNode(TestCase.view.angularGradient.conditional, size: CGSize(width: 100, height: 100)) {
      AngularGradientNode(
        colors: ["#FFFFFF:#000000", "#CCCCCC:#5C5B5B"]
      )
    }
  }

  @MainActor
  func testAngularGradientTopLeading() {
    testNode(TestCase.view.angularGradient.topLeading, size: CGSize(width: 100, height: 100)) {
      AngularGradientNode(
        colors: ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
        center: .topLeading,
        startAngle: 0,
        endAngle: 90
      )
    }
  }

  @MainActor
  func testAngularGradientBottomTrailing() {
    testNode(TestCase.view.angularGradient.bottomTrailing, size: CGSize(width: 100, height: 100)) {
      AngularGradientNode(
        colors: ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
        center: .bottomTrailing
      )
    }
  }

  @MainActor
  func testAngularGradientAlpha() {
    testNode(TestCase.view.angularGradient.alpha, size: CGSize(width: 100, height: 100)) {
      AngularGradientNode(
        colors: ["#FF000080", "#00FF0080", "#0000FF80", "#FF000080"]
      )
    }
  }
}
