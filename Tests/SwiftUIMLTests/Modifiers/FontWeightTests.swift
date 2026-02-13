//
//  FontWeightTests.swift
//  SwiftUIML
//
//  FontWeight modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class FontWeightTests: XCTestCase {
  @MainActor
  func testFontWeightLight() {
    testNode(TestCase.modifier.fontWeight.light, size: CGSize(width: 60, height: 30)) {
      TextNode("Light")
        .fontWeight(.light)
    }
  }

  @MainActor
  func testFontWeightRegular() {
    testNode(TestCase.modifier.fontWeight.regular, size: CGSize(width: 80, height: 30)) {
      TextNode("Regular")
        .fontWeight(.regular)
    }
  }

  @MainActor
  func testFontWeightSemibold() {
    testNode(TestCase.modifier.fontWeight.semibold, size: CGSize(width: 90, height: 30)) {
      TextNode("Semibold")
        .fontWeight(.semibold)
    }
  }

  @MainActor
  func testFontWeightBold() {
    testNode(TestCase.modifier.fontWeight.bold, size: CGSize(width: 60, height: 30)) {
      TextNode("Bold")
        .fontWeight(.bold)
    }
  }

  @MainActor
  func testFontWeightHeavy() {
    testNode(TestCase.modifier.fontWeight.heavy, size: CGSize(width: 70, height: 30)) {
      TextNode("Heavy")
        .fontWeight(.heavy)
    }
  }

  @MainActor
  func testFontWeightComparison() {
    testNode(TestCase.modifier.fontWeight.comparison, size: CGSize(width: 90, height: 130)) {
      VStackNode(spacing: 4) {
        TextNode("Light").fontWeight(.light)
        TextNode("Regular").fontWeight(.regular)
        TextNode("Semibold").fontWeight(.semibold)
        TextNode("Bold").fontWeight(.bold)
        TextNode("Heavy").fontWeight(.heavy)
      }
    }
  }
}
