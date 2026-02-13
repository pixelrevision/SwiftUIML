import XCTest
import Foundation
@testable import SwiftUIMLCore

final class NodeEnvironmentTests: XCTestCase {
  func testLocaleWithLocaleType() {
    let locale = Locale(identifier: "en_US")
    let node = TextNode("Test").locale(locale)
    XCTAssertEqual(node.attributes[.locale]?.string, "en_US")
  }

  func testTimeZoneWithTimeZoneType() throws {
    let timeZone = try XCTUnwrap(TimeZone(identifier: "America/New_York"))
    let node = TextNode("Test").timeZone(timeZone)
    XCTAssertEqual(node.attributes[.timeZone]?.string, "America/New_York")
  }

  func testTimeZoneLondon() throws {
    let node = TextNode("Test").timeZone(try XCTUnwrap(TimeZone(identifier: "Europe/London")))
    XCTAssertEqual(node.attributes[.timeZone]?.string, "Europe/London")
  }

  func testLocaleAndTimeZoneTogether() throws {
    let node = TextNode("Test")
      .locale(Locale(identifier: "en_GB"))
      .timeZone(try XCTUnwrap(TimeZone(identifier: "Europe/London")))

    XCTAssertEqual(node.attributes[.locale]?.string, "en_GB")
    XCTAssertEqual(node.attributes[.timeZone]?.string, "Europe/London")
  }

  func testLocaleAndTimeZoneWithTypes() throws {
    let locale = Locale(identifier: "de_DE")
    let timeZone = try XCTUnwrap(TimeZone(identifier: "Europe/Berlin"))

    let node = TextNode("Test")
      .locale(locale)
      .timeZone(timeZone)

    XCTAssertEqual(node.attributes[.locale]?.string, "de_DE")
    XCTAssertEqual(node.attributes[.timeZone]?.string, "Europe/Berlin")
  }

  func testLocaleOnDatePicker() throws {
    let timeZone = try XCTUnwrap(TimeZone(identifier: "UTC"))
    let node = DatePickerNode("Select Date", value: "2025-01-01T00:00:00Z")
      .locale(Locale(identifier: "en_US"))
      .timeZone(timeZone)

    XCTAssertEqual(node.attributes[.locale]?.string, "en_US")
    XCTAssertEqual(node.attributes[.timeZone]?.string, timeZone.identifier)
  }

  func testControlSize() {
    let node = ButtonNode("Test", onTap: "tap").controlSize(.large)
    XCTAssertEqual(node.attributes[.controlSize]?.string, "large")
  }

  func testControlSizeMini() {
    let node = ButtonNode("Test", onTap: "tap").controlSize(.mini)
    XCTAssertEqual(node.attributes[.controlSize]?.string, "mini")
  }

  func testControlSizeRegular() {
    let node = ButtonNode("Test", onTap: "tap").controlSize(.regular)
    XCTAssertEqual(node.attributes[.controlSize]?.string, "regular")
  }

  func testControlSizeOnPicker() {
    let node = PickerNode("Options", selection: "option1") {}
      .controlSize(.small)
    XCTAssertEqual(node.attributes[.controlSize]?.string, "small")
  }

  func testControlSizeOnText() {
    let node = TextNode("Hello")
      .controlSize(.extraLarge)
    XCTAssertEqual(node.attributes[.controlSize]?.string, "extraLarge")
  }

  func testKeyboardType() {
    let node = TextFieldNode("Email", value: "test@example.com")
      .keyboardType(.emailAddress)
    XCTAssertEqual(node.attributes[.keyboardType]?.string, "emailAddress")
  }

  func testKeyboardTypeDecimalPad() {
    let node = TextFieldNode("Price", value: "19.99")
      .keyboardType(.decimalPad)
    XCTAssertEqual(node.attributes[.keyboardType]?.string, "decimalPad")
  }

  func testAutocapitalization() {
    let node = TextFieldNode("Name", value: "John")
      .autocapitalization(.words)
    XCTAssertEqual(node.attributes[.autocapitalization]?.string, "words")
  }

  func testAutocapitalizationSentences() {
    let node = TextFieldNode("Comment", value: "Hello world")
      .autocapitalization(.sentences)
    XCTAssertEqual(node.attributes[.autocapitalization]?.string, "sentences")
  }
  
  func testAutocapitalizationAllCharacters() {
    let node = TextFieldNode("Comment", value: "Hello world")
      .autocapitalization(.allCharacters)
    XCTAssertEqual(node.attributes[.autocapitalization]?.string, "allCharacters")
  }

  func testTextContentType() {
    let node = TextFieldNode("Email", value: "user@example.com")
      .textContentType(.emailAddress)
    XCTAssertEqual(node.attributes[.textContentType]?.string, "emailAddress")
  }

  func testTextContentTypeUsername() {
    let node = TextFieldNode("Username", value: "johndoe")
      .textContentType(.username)
    XCTAssertEqual(node.attributes[.textContentType]?.string, "username")
  }

  func testTextContentTypePassword() {
    let node = TextFieldNode("Password", value: "")
      .textContentType(.password)
    XCTAssertEqual(node.attributes[.textContentType]?.string, "password")
  }

  func testSubmitLabel() {
    let node = TextFieldNode("Search", value: "")
      .submitLabel(.search)
    XCTAssertEqual(node.attributes[.submitLabel]?.string, "search")
  }

  func testSubmitLabelDone() {
    let node = TextFieldNode("Name", value: "")
      .submitLabel(.done)
    XCTAssertEqual(node.attributes[.submitLabel]?.string, "done")
  }

  func testSubmitLabelSend() {
    let node = TextFieldNode("Message", value: "")
      .submitLabel(.send)
    XCTAssertEqual(node.attributes[.submitLabel]?.string, "send")
  }
}
