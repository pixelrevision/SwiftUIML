import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class FontParsingTests: XCTestCase {
  // MARK: - Font.Weight Tests

  func testFontWeightUltraLight() {
    let result = Font.Weight("ultraLight")
    XCTAssertEqual(result, .ultraLight)
  }

  func testFontWeightThin() {
    let result = Font.Weight("thin")
    XCTAssertEqual(result, .thin)
  }

  func testFontWeightLight() {
    let result = Font.Weight("light")
    XCTAssertEqual(result, .light)
  }

  func testFontWeightRegular() {
    let result = Font.Weight("regular")
    XCTAssertEqual(result, .regular)
  }

  func testFontWeightMedium() {
    let result = Font.Weight("medium")
    XCTAssertEqual(result, .medium)
  }

  func testFontWeightSemibold() {
    let result = Font.Weight("semibold")
    XCTAssertEqual(result, .semibold)
  }

  func testFontWeightBold() {
    let result = Font.Weight("bold")
    XCTAssertEqual(result, .bold)
  }

  func testFontWeightHeavy() {
    let result = Font.Weight("heavy")
    XCTAssertEqual(result, .heavy)
  }

  func testFontWeightBlack() {
    let result = Font.Weight("black")
    XCTAssertEqual(result, .black)
  }

  func testFontWeightInvalid() {
    let result = Font.Weight("invalid")
    XCTAssertNil(result)
  }

  // MARK: - Font.Design Tests

  func testFontDesignDefault() {
    let result = Font.Design("default")
    XCTAssertEqual(result, .default)
  }

  func testFontDesignSerif() {
    let result = Font.Design("serif")
    XCTAssertEqual(result, .serif)
  }

  func testFontDesignRounded() {
    let result = Font.Design("rounded")
    XCTAssertEqual(result, .rounded)
  }

  func testFontDesignMonospaced() {
    let result = Font.Design("monospaced")
    XCTAssertEqual(result, .monospaced)
  }

  func testFontDesignInvalid() {
    let result = Font.Design("invalid")
    XCTAssertNil(result)
  }

  // MARK: - Font.TextStyle Tests

  func testFontTextStyleLargeTitle() {
    let result = Font.TextStyle("largeTitle")
    XCTAssertEqual(result, .largeTitle)
  }

  func testFontTextStyleTitle() {
    let result = Font.TextStyle("title")
    XCTAssertEqual(result, .title)
  }

  func testFontTextStyleTitle2() {
    let result = Font.TextStyle("title2")
    XCTAssertEqual(result, .title2)
  }

  func testFontTextStyleTitle3() {
    let result = Font.TextStyle("title3")
    XCTAssertEqual(result, .title3)
  }

  func testFontTextStyleHeadline() {
    let result = Font.TextStyle("headline")
    XCTAssertEqual(result, .headline)
  }

  func testFontTextStyleSubheadline() {
    let result = Font.TextStyle("subheadline")
    XCTAssertEqual(result, .subheadline)
  }

  func testFontTextStyleBody() {
    let result = Font.TextStyle("body")
    XCTAssertEqual(result, .body)
  }

  func testFontTextStyleCallout() {
    let result = Font.TextStyle("callout")
    XCTAssertEqual(result, .callout)
  }

  func testFontTextStyleFootnote() {
    let result = Font.TextStyle("footnote")
    XCTAssertEqual(result, .footnote)
  }

  func testFontTextStyleCaption() {
    let result = Font.TextStyle("caption")
    XCTAssertEqual(result, .caption)
  }

  func testFontTextStyleCaption2() {
    let result = Font.TextStyle("caption2")
    XCTAssertEqual(result, .caption2)
  }

  func testFontTextStyleInvalid() {
    let result = Font.TextStyle("invalid")
    XCTAssertNil(result)
  }
}
