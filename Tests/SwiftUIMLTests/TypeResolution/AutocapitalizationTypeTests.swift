import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class AutocapitalizationTypeTests: XCTestCase {
  func testAutocapitalizationTypeNone() {
    let result = UITextAutocapitalizationType(AttributeValue("none"))
    XCTAssertEqual(result, UITextAutocapitalizationType.none)
  }

  func testAutocapitalizationTypeWords() {
    let result = UITextAutocapitalizationType(AttributeValue("words"))
    XCTAssertEqual(result, UITextAutocapitalizationType.words)
  }

  func testAutocapitalizationTypeSentences() {
    let result = UITextAutocapitalizationType(AttributeValue("sentences"))
    XCTAssertEqual(result, UITextAutocapitalizationType.sentences)
  }

  func testAutocapitalizationTypeAllCharacters() {
    let result = UITextAutocapitalizationType(AttributeValue("allCharacters"))
    XCTAssertEqual(result, UITextAutocapitalizationType.allCharacters)
  }

  func testAutocapitalizationTypeInvalid() {
    let result = UITextAutocapitalizationType(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
