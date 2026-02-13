import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class SubmitLabelTests: XCTestCase {
  func testSubmitLabelDone() {
    let result = SubmitLabel(AttributeValue("done"))
    XCTAssertNotNil(result)
  }

  func testSubmitLabelGo() {
    let result = SubmitLabel(AttributeValue("go"))
    XCTAssertNotNil(result)
  }

  func testSubmitLabelSend() {
    let result = SubmitLabel(AttributeValue("send"))
    XCTAssertNotNil(result)
  }

  func testSubmitLabelJoin() {
    let result = SubmitLabel(AttributeValue("join"))
    XCTAssertNotNil(result)
  }

  func testSubmitLabelRoute() {
    let result = SubmitLabel(AttributeValue("route"))
    XCTAssertNotNil(result)
  }

  func testSubmitLabelSearch() {
    let result = SubmitLabel(AttributeValue("search"))
    XCTAssertNotNil(result)
  }

  func testSubmitLabelReturn() {
    let result = SubmitLabel(AttributeValue("return"))
    XCTAssertNotNil(result)
  }

  func testSubmitLabelNext() {
    let result = SubmitLabel(AttributeValue("next"))
    XCTAssertNotNil(result)
  }

  func testSubmitLabelContinue() {
    let result = SubmitLabel(AttributeValue("continue"))
    XCTAssertNotNil(result)
  }

  func testSubmitLabelInvalid() {
    let result = SubmitLabel(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
