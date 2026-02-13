import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class KeyboardTypeTests: XCTestCase {
  func testKeyboardTypeDefault() {
    let result = UIKeyboardType(AttributeValue("default"))
    XCTAssertEqual(result, UIKeyboardType.default)
  }

  func testKeyboardTypeAsciiCapable() {
    let result = UIKeyboardType(AttributeValue("asciiCapable"))
    XCTAssertEqual(result, UIKeyboardType.asciiCapable)
  }

  func testKeyboardTypeNumbersAndPunctuation() {
    let result = UIKeyboardType(AttributeValue("numbersAndPunctuation"))
    XCTAssertEqual(result, UIKeyboardType.numbersAndPunctuation)
  }

  func testKeyboardTypeURL() {
    let result = UIKeyboardType(AttributeValue("URL"))
    XCTAssertEqual(result, UIKeyboardType.URL)
  }

  func testKeyboardTypeNumberPad() {
    let result = UIKeyboardType(AttributeValue("numberPad"))
    XCTAssertEqual(result, UIKeyboardType.numberPad)
  }

  func testKeyboardTypePhonePad() {
    let result = UIKeyboardType(AttributeValue("phonePad"))
    XCTAssertEqual(result, UIKeyboardType.phonePad)
  }

  func testKeyboardTypeNamePhonePad() {
    let result = UIKeyboardType(AttributeValue("namePhonePad"))
    XCTAssertEqual(result, UIKeyboardType.namePhonePad)
  }

  func testKeyboardTypeEmailAddress() {
    let result = UIKeyboardType(AttributeValue("emailAddress"))
    XCTAssertEqual(result, UIKeyboardType.emailAddress)
  }

  func testKeyboardTypeDecimalPad() {
    let result = UIKeyboardType(AttributeValue("decimalPad"))
    XCTAssertEqual(result, UIKeyboardType.decimalPad)
  }

  func testKeyboardTypeTwitter() {
    let result = UIKeyboardType(AttributeValue("twitter"))
    XCTAssertEqual(result, UIKeyboardType.twitter)
  }

  func testKeyboardTypeWebSearch() {
    let result = UIKeyboardType(AttributeValue("webSearch"))
    XCTAssertEqual(result, UIKeyboardType.webSearch)
  }

  func testKeyboardTypeAsciiCapableNumberPad() {
    let result = UIKeyboardType(AttributeValue("asciiCapableNumberPad"))
    XCTAssertEqual(result, UIKeyboardType.asciiCapableNumberPad)
  }

  func testKeyboardTypeInvalid() {
    let result = UIKeyboardType(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
