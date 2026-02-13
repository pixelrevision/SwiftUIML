//
//  SpecialNumericValuesTests.swift
//  SwiftUIML
//
//  Tests for special numeric value serialization (infinity, -infinity, NaN)
//

import Foundation
import SwiftUIMLCore
import XCTest

final class SpecialNumericValuesTests: XCTestCase {
  // MARK: - Encoding Tests

  func testInfinityEncoding() throws {
    let value = AttributeValue.number(.infinity)
    let data = try JSONEncoder().encode(value)
    let json = String(data: data, encoding: .utf8)

    XCTAssertEqual(json, "\"$infinity\"")
  }

  func testNegativeInfinityEncoding() throws {
    let value = AttributeValue.number(-.infinity)
    let data = try JSONEncoder().encode(value)
    let json = String(data: data, encoding: .utf8)

    XCTAssertEqual(json, "\"$-infinity\"")
  }

  func testNaNEncoding() throws {
    let value = AttributeValue.number(.nan)
    let data = try JSONEncoder().encode(value)
    let json = String(data: data, encoding: .utf8)

    XCTAssertEqual(json, "\"$nan\"")
  }

  func testRegularNumberEncoding() throws {
    let value = AttributeValue.number(42.5)
    let data = try JSONEncoder().encode(value)
    let json = String(data: data, encoding: .utf8)

    XCTAssertEqual(json, "42.5")
  }

  // MARK: - Decoding Tests

  func testInfinityDecoding() throws {
    let json = "\"$infinity\""
    let data = try XCTUnwrap(json.data(using: .utf8))
    let value = try JSONDecoder().decode(AttributeValue.self, from: data)

    guard case .number(let number) = value else {
      XCTFail("Expected .number, got \(value)")
      return
    }

    XCTAssertTrue(number.isInfinite)
    XCTAssertEqual(number.sign, .plus)
  }

  func testNegativeInfinityDecoding() throws {
    let json = "\"$-infinity\""
    let data = try XCTUnwrap(json.data(using: .utf8))
    let value = try JSONDecoder().decode(AttributeValue.self, from: data)

    guard case .number(let number) = value else {
      XCTFail("Expected .number, got \(value)")
      return
    }

    XCTAssertTrue(number.isInfinite)
    XCTAssertEqual(number.sign, .minus)
  }

  func testNaNDecoding() throws {
    let json = "\"$nan\""
    let data = try XCTUnwrap(json.data(using: .utf8))
    let value = try JSONDecoder().decode(AttributeValue.self, from: data)

    guard case .number(let number) = value else {
      XCTFail("Expected .number, got \(value)")
      return
    }

    XCTAssertTrue(number.isNaN)
  }

  // MARK: - Backward Compatibility Tests

  func testLegacyInfinityStringDecoding() throws {
    let json = "\"infinity\""
    let data = try XCTUnwrap(json.data(using: .utf8))
    let value = try JSONDecoder().decode(AttributeValue.self, from: data)

    // Legacy "infinity" is decoded as a string, not a number
    guard case .string(let string) = value else {
      XCTFail("Expected .string, got \(value)")
      return
    }

    XCTAssertEqual(string, "infinity")

    // But cgFloat getter should still handle it for backward compatibility
    XCTAssertEqual(value.cgFloat, .infinity)
  }

  // MARK: - CGFloat Conversion Tests

  func testCGFloatConversionFromInfinity() {
    let value = AttributeValue("$infinity")
    XCTAssertEqual(value.cgFloat, .infinity)
  }

  func testCGFloatConversionFromNegativeInfinity() {
    let value = AttributeValue("$-infinity")
    XCTAssertEqual(value.cgFloat, -.infinity)
  }

  func testCGFloatConversionFromNaN() throws {
    let value = AttributeValue("$nan")
    let cgFloat = try XCTUnwrap(value.cgFloat)
    XCTAssertTrue(cgFloat.isNaN)
  }

  func testCGFloatConversionFromLegacyInfinity() {
    let value = AttributeValue("infinity")
    XCTAssertEqual(value.cgFloat, .infinity)
  }

  // MARK: - Node Serialization Tests

  func testNodeWithInfinityFrameEncoding() throws {
    let node = TextNode("Hello")
      .addingAttribute(.frame, value: .dict([.maxWidth: .number(.infinity)]))

    let encoder = JSONEncoder()
    encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
    let data = try encoder.encode(node)
    let json = try XCTUnwrap(String(data: data, encoding: .utf8))

    XCTAssertTrue(json.contains("\"$infinity\""))
  }

  func testNodeWithInfinityFrameRoundTrip() throws {
    let original = TextNode("Hello")
      .addingAttribute(.frame, value: .dict([.maxWidth: .number(.infinity)]))

    let data = try JSONEncoder().encode(original)
    let decoded = try JSONDecoder().decode(Node.self, from: data)

    guard let frameDict = decoded.attributes[.frame]?.dict,
      let maxWidth = frameDict[.maxWidth],
      case .number(let value) = maxWidth else {
      XCTFail("Failed to decode frame attribute")
      return
    }

    XCTAssertTrue(value.isInfinite)
    XCTAssertEqual(value.sign, .plus)
  }

  // MARK: - Array/Dict Nesting Tests

  func testInfinityInArray() throws {
    let value = AttributeValue.array([
      .number(.infinity),
      .number(42),
      .number(-.infinity),
      .number(.nan),
    ])

    let data = try JSONEncoder().encode(value)
    let decoded = try JSONDecoder().decode(AttributeValue.self, from: data)

    guard case .array(let arr) = decoded else {
      XCTFail("Expected array")
      return
    }

    XCTAssertEqual(arr.count, 4)

    guard case .number(let first) = arr[0] else {
      XCTFail("Expected number at index 0")
      return
    }
    XCTAssertTrue(first.isInfinite)
    XCTAssertEqual(first.sign, .plus)

    guard case .number(let third) = arr[2] else {
      XCTFail("Expected number at index 2")
      return
    }
    XCTAssertTrue(third.isInfinite)
    XCTAssertEqual(third.sign, .minus)

    guard case .number(let fourth) = arr[3] else {
      XCTFail("Expected number at index 3")
      return
    }
    XCTAssertTrue(fourth.isNaN)
  }

  func testInfinityInDict() throws {
    let value = AttributeValue.dict([
      AttributeKey("maxWidth"): .number(.infinity),
      AttributeKey("minWidth"): .number(0),
      AttributeKey("maxHeight"): .number(-.infinity),
    ])

    let data = try JSONEncoder().encode(value)
    let decoded = try JSONDecoder().decode(AttributeValue.self, from: data)

    guard case .dict(let dict) = decoded else {
      XCTFail("Expected dict")
      return
    }

    guard case .number(let maxWidth) = dict[AttributeKey("maxWidth")] else {
      XCTFail("Expected number for maxWidth")
      return
    }
    XCTAssertTrue(maxWidth.isInfinite)
    XCTAssertEqual(maxWidth.sign, .plus)

    guard case .number(let maxHeight) = dict[AttributeKey("maxHeight")] else {
      XCTFail("Expected number for maxHeight")
      return
    }
    XCTAssertTrue(maxHeight.isInfinite)
    XCTAssertEqual(maxHeight.sign, .minus)
  }
}
