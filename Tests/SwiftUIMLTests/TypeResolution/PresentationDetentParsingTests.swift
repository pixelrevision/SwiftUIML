import XCTest
@testable import SwiftUIML
import SwiftUI

class PresentationDetentParsingTests: XCTestCase {
  func testPresentationDetentMedium() {
    let detent = PresentationDetent("medium")
    XCTAssertNotNil(detent)
    XCTAssertEqual(detent, .medium)
  }

  func testPresentationDetentLarge() {
    let detent = PresentationDetent("large")
    XCTAssertNotNil(detent)
    XCTAssertEqual(detent, .large)
  }

  func testPresentationDetentInvalid() {
    let detent = PresentationDetent("invalid")
    XCTAssertNil(detent)
  }

  func testPresentationDetentDictMedium() {
    let detent = PresentationDetent([.type: .string("medium")])
    XCTAssertNotNil(detent)
    XCTAssertEqual(detent, .medium)
  }

  func testPresentationDetentDictLarge() {
    let detent = PresentationDetent([.type: .string("large")])
    XCTAssertNotNil(detent)
    XCTAssertEqual(detent, .large)
  }

  func testPresentationDetentDictFraction() {
    let detent = PresentationDetent([
      .type: .string("fraction"),
      .value: .number(0.5),
    ])
    XCTAssertNotNil(detent)
    XCTAssertEqual(detent, .fraction(0.5))
  }

  func testPresentationDetentDictHeight() {
    let detent = PresentationDetent([
      .type: .string("height"),
      .value: .number(300),
    ])
    XCTAssertNotNil(detent)
    XCTAssertEqual(detent, .height(300))
  }

  func testPresentationDetentDictInvalidType() {
    let detent = PresentationDetent([.type: .string("invalid")])
    XCTAssertNil(detent)
  }

  func testPresentationDetentDictMissingType() {
    let detent = PresentationDetent([.value: .number(0.5)])
    XCTAssertNil(detent)
  }

  func testPresentationDetentDictFractionMissingValue() {
    let detent = PresentationDetent([.type: .string("fraction")])
    XCTAssertNil(detent)
  }

  func testPresentationDetentDictHeightMissingValue() {
    let detent = PresentationDetent([.type: .string("height")])
    XCTAssertNil(detent)
  }
}
