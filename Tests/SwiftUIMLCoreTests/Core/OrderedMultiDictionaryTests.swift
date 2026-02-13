import XCTest
@testable import SwiftUIMLCore

final class OrderedMultiDictionaryTests: XCTestCase {
  // MARK: - Initialization

  func testEmptyInitialization() {
    let dict = OrderedMultiDictionary<String, Int>()
    XCTAssertTrue(dict.isEmpty)
    XCTAssertEqual(dict.count, 0)
  }

  func testSequenceInitialization() {
    let pairs = [("a", 1), ("b", 2), ("a", 3)]
    let dict = OrderedMultiDictionary(pairs)

    XCTAssertEqual(dict.count, 3)
    XCTAssertEqual(dict["a"], 1) // First value for "a"
    XCTAssertEqual(dict["b"], 2)
  }

  func testDictionaryLiteralInitialization() {
    // swiftlint:disable:next duplicated_key_in_dictionary_literal
    let dict: OrderedMultiDictionary<String, Int> = ["a": 1, "b": 2, "a": 3, "c": 4]

    XCTAssertEqual(dict.count, 4) // Should include both "a" entries
    XCTAssertEqual(dict["a"], 1) // Returns first value for "a"
    XCTAssertEqual(dict["b"], 2)
    XCTAssertEqual(dict["c"], 4)
    XCTAssertEqual(dict.values(forKey: "a"), [1, 3]) // Both "a" values preserved
  }

  // MARK: - Append

  func testAppendSingleValue() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)

    XCTAssertEqual(dict.count, 1)
    XCTAssertEqual(dict["a"], 1)
  }

  func testAppendDuplicateKeys() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)
    dict.append("c", 4)

    XCTAssertEqual(dict.count, 4)
    XCTAssertEqual(dict["a"], 1) // Returns first value
    XCTAssertEqual(dict.values(forKey: "a"), [1, 3])
  }

  // MARK: - Subscript Access

  func testSubscriptGet() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("a", 2)

    XCTAssertEqual(dict["a"], 1) // Returns first value
    XCTAssertNil(dict["nonexistent"])
  }

  func testSubscriptSetExistingKey() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("a", 2)

    dict["a"] = 100

    XCTAssertEqual(dict["a"], 100) // First value updated
    XCTAssertEqual(dict.values(forKey: "a"), [100, 2]) // Second value unchanged
  }

  func testSubscriptSetNewKey() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict["a"] = 1

    XCTAssertEqual(dict.count, 1)
    XCTAssertEqual(dict["a"], 1)
  }

  func testSubscriptSetNilRemoves() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("a", 2)
    dict.append("b", 3)

    dict["a"] = nil

    XCTAssertNil(dict["a"])
    XCTAssertEqual(dict.count, 1)
    XCTAssertEqual(dict["b"], 3)
  }

  // MARK: - Contains

  func testContains() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)

    XCTAssertTrue(dict.contains("a"))
    XCTAssertFalse(dict.contains("b"))
  }

  // MARK: - Values for Key

  func testValuesForKey() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)
    dict.append("a", 5)

    XCTAssertEqual(dict.values(forKey: "a"), [1, 3, 5])
    XCTAssertEqual(dict.values(forKey: "b"), [2])
    XCTAssertEqual(dict.values(forKey: "c"), [])
  }

  // MARK: - Update Value at Index

  func testUpdateValueAtIndex() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)

    dict.updateValue(at: 0, to: 100)
    dict.updateValue(at: 2, to: 300)

    XCTAssertEqual(dict[0].value, 100)
    XCTAssertEqual(dict[2].value, 300)
    XCTAssertEqual(dict.values(forKey: "a"), [100, 300])
  }

  // MARK: - Update Key at Index

  func testUpdateKeyAtIndex() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)

    dict.updateKey(at: 0, to: "x")

    XCTAssertEqual(dict[0].key, "x")
    XCTAssertEqual(dict["x"], 1)
    XCTAssertEqual(dict.values(forKey: "a"), [3]) // Only one "a" left
    XCTAssertTrue(dict.contains("x"))
  }

  // MARK: - Remove All for Key

  func testRemoveAllForKey() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)
    dict.append("c", 4)

    dict.removeAll(forKey: "a")

    XCTAssertEqual(dict.count, 2)
    XCTAssertFalse(dict.contains("a"))
    XCTAssertEqual(dict[0].key, "b")
    XCTAssertEqual(dict[1].key, "c")
  }

  func testRemoveAllForNonexistentKey() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)

    dict.removeAll(forKey: "b") // Should not crash

    XCTAssertEqual(dict.count, 1)
  }

  // MARK: - Remove at Index

  func testRemoveAtIndex() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("c", 3)

    dict.remove(at: 1)

    XCTAssertEqual(dict.count, 2)
    XCTAssertEqual(dict[0].key, "a")
    XCTAssertEqual(dict[1].key, "c")
    XCTAssertFalse(dict.contains("b"))
  }

  // MARK: - Remove All

  func testRemoveAll() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)

    dict.removeAll()

    XCTAssertTrue(dict.isEmpty)
    XCTAssertEqual(dict.count, 0)
  }

  // MARK: - Keys and Values

  func testKeys() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)

    XCTAssertEqual(dict.keys, ["a", "b", "a"])
  }

  func testValues() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)

    XCTAssertEqual(dict.values, [1, 2, 3])
  }

  func testUniqueKeys() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)
    dict.append("c", 4)

    XCTAssertEqual(dict.uniqueKeys, Set(["a", "b", "c"]))
  }

  // MARK: - Iteration

  func testIteration() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)
    dict.append("c", 4)

    var results: [(String, Int)] = []
    for (key, value) in dict {
      results.append((key, value))
    }

    XCTAssertEqual(results.count, 4)
    XCTAssertEqual(results[0].0, "a")
    XCTAssertEqual(results[0].1, 1)
    XCTAssertEqual(results[1].0, "b")
    XCTAssertEqual(results[1].1, 2)
    XCTAssertEqual(results[2].0, "a")
    XCTAssertEqual(results[2].1, 3)
    XCTAssertEqual(results[3].0, "c")
    XCTAssertEqual(results[3].1, 4)
  }

  // MARK: - Collection

  func testCollectionSubscript() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)

    let first = dict[0]
    XCTAssertEqual(first.key, "a")
    XCTAssertEqual(first.value, 1)

    let second = dict[1]
    XCTAssertEqual(second.key, "b")
    XCTAssertEqual(second.value, 2)
  }

  func testCollectionIndices() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("c", 3)

    XCTAssertEqual(dict.startIndex, 0)
    XCTAssertEqual(dict.endIndex, 3)
  }

  // MARK: - Equatable

  func testEquality() {
    let dict1: OrderedMultiDictionary<String, Int> = {
      var d = OrderedMultiDictionary<String, Int>()
      d.append("a", 1)
      d.append("b", 2)
      d.append("a", 3)
      return d
    }()

    let dict2: OrderedMultiDictionary<String, Int> = {
      var d = OrderedMultiDictionary<String, Int>()
      d.append("a", 1)
      d.append("b", 2)
      d.append("a", 3)
      return d
    }()

    XCTAssertEqual(dict1, dict2)
  }

  func testInequality() {
    let dict1: OrderedMultiDictionary<String, Int> = {
      var d = OrderedMultiDictionary<String, Int>()
      d.append("a", 1)
      d.append("b", 2)
      return d
    }()

    let dict2: OrderedMultiDictionary<String, Int> = {
      var d = OrderedMultiDictionary<String, Int>()
      d.append("b", 2)
      d.append("a", 1)
      return d
    }()

    XCTAssertNotEqual(dict1, dict2) // Order matters
  }

  // MARK: - Hashable

  func testHashable() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)

    var set = Set<OrderedMultiDictionary<String, Int>>()
    set.insert(dict)

    XCTAssertTrue(set.contains(dict))
  }

  // MARK: - Codable

  func testEncoding2DArray() throws {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)
    dict.append("c", 4)

    let encoder = JSONEncoder()
    let data = try encoder.encode(dict)
    let json = try JSONSerialization.jsonObject(with: data) as? [[Any]]

    // Should encode as: [["a", 1], ["b", 2], ["a", 3], ["c", 4]]
    XCTAssertNotNil(json)
    XCTAssertEqual(json?.count, 4)
    XCTAssertEqual(json?[0][0] as? String, "a")
    XCTAssertEqual(json?[0][1] as? Int, 1)
    XCTAssertEqual(json?[1][0] as? String, "b")
    XCTAssertEqual(json?[1][1] as? Int, 2)
    XCTAssertEqual(json?[2][0] as? String, "a")
    XCTAssertEqual(json?[2][1] as? Int, 3)
    XCTAssertEqual(json?[3][0] as? String, "c")
    XCTAssertEqual(json?[3][1] as? Int, 4)
  }

  func testDecoding2DArray() throws {
    // JSON: [["a", 1], ["b", 2], ["a", 3]]
    let json = [["a", 1], ["b", 2], ["a", 3]] as [[Any]]
    let data = try JSONSerialization.data(withJSONObject: json)

    let decoder = JSONDecoder()
    let dict = try decoder.decode(OrderedMultiDictionary<String, Int>.self, from: data)

    XCTAssertEqual(dict.count, 3)
    XCTAssertEqual(dict[0].key, "a")
    XCTAssertEqual(dict[0].value, 1)
    XCTAssertEqual(dict[1].key, "b")
    XCTAssertEqual(dict[1].value, 2)
    XCTAssertEqual(dict[2].key, "a")
    XCTAssertEqual(dict[2].value, 3)
  }

  func testRoundTripEncoding() throws {
    var original = OrderedMultiDictionary<String, Int>()
    original.append("a", 1)
    original.append("b", 2)
    original.append("a", 3)
    original.append("c", 4)

    let encoder = JSONEncoder()
    let data = try encoder.encode(original)

    let decoder = JSONDecoder()
    let decoded = try decoder.decode(OrderedMultiDictionary<String, Int>.self, from: data)

    XCTAssertEqual(original, decoded)
  }

  func testDecodingEmptyArraysThrowsError() throws {
    // JSON with empty arrays should throw a decoding error
    let json = [["a", 1], [], ["b", 2]] as [[Any]]
    let data = try JSONSerialization.data(withJSONObject: json)

    let decoder = JSONDecoder()
    XCTAssertThrowsError(try decoder.decode(OrderedMultiDictionary<String, Int>.self, from: data)) { error in
      // Verify it's a DecodingError with the expected message
      if let decodingError = error as? DecodingError,
        case let .dataCorrupted(context) = decodingError {
        XCTAssertEqual(context.debugDescription, "Cannot decode empty array as key-value pair")
      }
      else {
        XCTFail("Expected DecodingError.dataCorrupted, got \(error)")
      }
    }
  }

  // MARK: - CustomStringConvertible

  func testDescription() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)

    let description = dict.description
    XCTAssertTrue(description.contains("a: 1"))
    XCTAssertTrue(description.contains("b: 2"))
  }

  func testDebugDescription() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)

    let debugDescription = dict.debugDescription
    XCTAssertTrue(debugDescription.contains("OrderedMultiDictionary"))
    XCTAssertTrue(debugDescription.contains("(a, 1)"))
    XCTAssertTrue(debugDescription.contains("(b, 2)"))
  }

  // MARK: - Functional Methods

  func testAppending() {
    let dict: OrderedMultiDictionary<String, Int> = ["a": 1, "b": 2]
    let updated = dict.appending("c", 3)

    // Original unchanged
    XCTAssertEqual(dict.count, 2)
    XCTAssertFalse(dict.contains("c"))

    // New dict has the appended value
    XCTAssertEqual(updated.count, 3)
    XCTAssertTrue(updated.contains("c"))
    XCTAssertEqual(updated["c"], 3)
  }

  func testAppendingDuplicateKey() {
    let dict: OrderedMultiDictionary<String, Int> = ["a": 1, "b": 2]
    let updated = dict.appending("a", 3)

    XCTAssertEqual(dict.values(forKey: "a"), [1])
    XCTAssertEqual(updated.values(forKey: "a"), [1, 3])
  }

  func testUpdatingValue() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)

    let updated = dict.updatingValue(at: 1, to: 100)

    // Original unchanged
    XCTAssertEqual(dict[1].value, 2)

    // New dict has updated value
    XCTAssertEqual(updated[1].value, 100)
  }

  func testUpdatingKey() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)

    let updated = dict.updatingKey(at: 0, to: "x")

    // Original unchanged
    XCTAssertEqual(dict[0].key, "a")
    XCTAssertTrue(dict.contains("a"))

    // New dict has updated key
    XCTAssertEqual(updated[0].key, "x")
    XCTAssertTrue(updated.contains("x"))
    XCTAssertFalse(updated.contains("a"))
  }

  func testRemovingAll() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)

    let updated = dict.removingAll(forKey: "a")

    // Original unchanged
    XCTAssertEqual(dict.count, 3)
    XCTAssertTrue(dict.contains("a"))

    // New dict has key removed
    XCTAssertEqual(updated.count, 1)
    XCTAssertFalse(updated.contains("a"))
    XCTAssertTrue(updated.contains("b"))
  }

  func testRemoving() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("c", 3)

    let updated = dict.removing(at: 1)

    // Original unchanged
    XCTAssertEqual(dict.count, 3)
    XCTAssertEqual(dict[1].key, "b")

    // New dict has element removed
    XCTAssertEqual(updated.count, 2)
    XCTAssertEqual(updated[0].key, "a")
    XCTAssertEqual(updated[1].key, "c")
  }

  func testSetting() {
    let dict: OrderedMultiDictionary<String, Int> = ["a": 1, "b": 2]
    let updated = dict.setting("c", to: 3)

    // Original unchanged
    XCTAssertNil(dict["c"])
    XCTAssertEqual(dict.count, 2)

    // New dict has value set
    XCTAssertEqual(updated["c"], 3)
    XCTAssertEqual(updated.count, 3)
  }

  func testSettingExistingKey() {
    let dict: OrderedMultiDictionary<String, Int> = ["a": 1, "b": 2]
    let updated = dict.setting("a", to: 100)

    // Original unchanged
    XCTAssertEqual(dict["a"], 1)

    // New dict has value updated
    XCTAssertEqual(updated["a"], 100)
    XCTAssertEqual(updated.count, 2) // Count unchanged
  }

  func testChainedFunctionalCalls() {
    let dict: OrderedMultiDictionary<String, Int> = ["a": 1]

    let result = dict
      .appending("b", 2)
      .appending("a", 3)
      .appending("c", 4)
      .removingAll(forKey: "a")
      .setting("b", to: 100)

    // Original unchanged
    XCTAssertEqual(dict.count, 1)
    XCTAssertEqual(dict["a"], 1)

    // Result has all transformations applied
    XCTAssertEqual(result.count, 2)
    XCTAssertFalse(result.contains("a"))
    XCTAssertEqual(result["b"], 100)
    XCTAssertEqual(result["c"], 4)
  }

  // MARK: - Remove First

  func testRemoveFirst() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)
    dict.append("c", 4)

    let removed = dict.removeFirst(forKey: "a")

    XCTAssertEqual(removed, 1) // Returns first value
    XCTAssertEqual(dict.count, 3) // Only removed one entry
    XCTAssertEqual(dict.values(forKey: "a"), [3]) // Second "a" still present
    XCTAssertEqual(dict[0].key, "b") // Order maintained
    XCTAssertEqual(dict[1].key, "a") // This was the second "a"
    XCTAssertEqual(dict[2].key, "c")
  }

  func testRemoveFirstNonexistentKey() {
    var dict = OrderedMultiDictionary<String, Int>()
    dict.append("a", 1)

    let removed = dict.removeFirst(forKey: "b")

    XCTAssertNil(removed)
    XCTAssertEqual(dict.count, 1) // Nothing removed
  }

  func testRemoveFirstVsRemoveAll() {
    var dict1 = OrderedMultiDictionary<String, Int>()
    dict1.append("a", 1)
    dict1.append("a", 2)
    dict1.append("a", 3)

    var dict2 = dict1

    // removeFirst only removes first occurrence
    dict1.removeFirst(forKey: "a")
    XCTAssertEqual(dict1.count, 2)
    XCTAssertEqual(dict1.values(forKey: "a"), [2, 3])

    // removeAll removes all occurrences
    dict2.removeAll(forKey: "a")
    XCTAssertEqual(dict2.count, 0)
    XCTAssertFalse(dict2.contains("a"))
  }

  // MARK: - Real-World Usage Example

  func testRealWorldExample() {
    // Example from user's request
    var dict = OrderedMultiDictionary<String, Int>()

    // Add duplicate keys
    dict.append("a", 1)
    dict.append("b", 2)
    dict.append("a", 3)
    dict.append("c", 4)

    // Fast key lookup
    XCTAssertTrue(dict.contains("a"))
    XCTAssertEqual(dict["a"], 1) // Returns first value

    // Get all values for a key
    XCTAssertEqual(dict.values(forKey: "a"), [1, 3])

    // Iterate in order
    var output: [String] = []
    for (key, value) in dict {
      output.append("\(key): \(value)")
    }
    XCTAssertEqual(output, ["a: 1", "b: 2", "a: 3", "c: 4"])

    // Remove all entries for a key
    dict.removeAll(forKey: "a")
    XCTAssertEqual(dict.count, 2)
    XCTAssertFalse(dict.contains("a"))

    // Update specific position
    dict.updateValue(at: 0, to: 100)
    XCTAssertEqual(dict[0].value, 100)
  }
}
