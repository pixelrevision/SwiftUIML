// swiftlint:disable file_length
import Foundation

/// Protocol for types that support lenient parsing from single-element arrays.
/// When decoding `[["key"]]`, the missing value is replaced with `defaultSingleElementValue`.
public protocol SingleElementDecodable {
  static var defaultSingleElementValue: Self { get }
}

/// A dictionary-like collection that maintains insertion order and allows duplicate keys.
///
/// `OrderedMultiDictionary` stores key-value pairs in the order they are inserted and permits
/// multiple values for the same key. It provides O(1) key lookup while preserving order.
///
/// ## Example Usage
///
/// ```swift
/// var dict: OrderedMultiDictionary<String, Int> = [:]
///
/// // Add duplicate keys
/// dict.append("a", 1)
/// dict.append("b", 2)
/// dict.append("a", 3)
/// dict.append("c", 4)
///
/// // Fast key lookup
/// print(dict.contains("a"))  // true
/// print(dict["a"])           // Optional(1) - returns first value
///
/// // Get all values for a key
/// print(dict.values(forKey: "a"))  // [1, 3]
///
/// // Iterate in order
/// for (key, value) in dict {
///     print("\(key): \(value)")
/// }
/// // Output: a: 1, b: 2, a: 3, c: 4
///
/// // Functional API - returns copies instead of mutating
/// let updated = dict
///   .appending("d", 5)
///   .removingAll(forKey: "a")
///   .setting("b", to: 100)
/// ```
///
/// ## Encoding/Decoding
///
/// When encoded to JSON, the dictionary is serialized as a 2D array:
/// `[["key1", "value1"], ["key2", "value2"], ...]`
///
/// Lenient parsing is supported during decoding:
/// - `[["key"]]` uses the type's default value when `Value` conforms to `SingleElementDecodable`
/// - `[[]]` empty entries cause a decoding error
public struct OrderedMultiDictionary<Key: Hashable, Value> {
  /// Internal storage: array of key-value pairs maintaining insertion order
  private var elements: [(key: Key, value: Value)] = []

  /// Index mapping: tracks all positions where each key appears for fast lookup
  private var keyIndices: [Key: [Int]] = [:]

  /// Creates an empty ordered multi-dictionary.
  public init() {}

  /// Creates an ordered multi-dictionary from a sequence of key-value pairs.
  public init<S: Sequence>(_ elements: S) where S.Element == (Key, Value) {
    for (key, value) in elements {
      append(key, value)
    }
  }

  /// The number of key-value pairs in the dictionary.
  public var count: Int {
    elements.count
  }

  /// A Boolean value indicating whether the dictionary is empty.
  public var isEmpty: Bool {
    elements.isEmpty
  }

  /// Returns a Boolean value indicating whether the dictionary contains the given key.
  public func contains(_ key: Key) -> Bool {
    keyIndices[key] != nil
  }

  /// Accesses the first value associated with the given key for reading and writing.
  ///
  /// Returns `nil` if the key is not present. When setting a value, if the key exists,
  /// only the first occurrence is updated. If the key doesn't exist, a new entry is appended.
  public subscript(key: Key) -> Value? {
    get {
      guard let indices = keyIndices[key], let firstIndex = indices.first else {
        return nil
      }
      return elements[firstIndex].value
    }
    set {
      if let newValue = newValue {
        if let indices = keyIndices[key], let firstIndex = indices.first {
          // Update first occurrence
          elements[firstIndex].value = newValue
        }
        else {
          // Append new entry
          append(key, newValue)
        }
      }
      else {
        // Remove all occurrences
        removeAll(forKey: key)
      }
    }
  }

  /// Returns all values associated with the given key, in insertion order.
  public func values(forKey key: Key) -> [Value] {
    guard let indices = keyIndices[key] else { return [] }
    return indices.map { elements[$0].value }
  }

  /// Appends a new key-value pair to the end of the dictionary.
  ///
  /// This method allows duplicate keys. The new pair is always added at the end.
  public mutating func append(_ key: Key, _ value: Value) {
    let newIndex = elements.count
    elements.append((key, value))

    if keyIndices[key] != nil {
      keyIndices[key]?.append(newIndex)
    }
    else {
      keyIndices[key] = [newIndex]
    }
  }

  /// Updates the value at the specified position.
  /// - Parameters:
  ///   - index: The position of the value to update. Must be valid (0..<count).
  ///   - newValue: The new value to store at the position.
  /// - Precondition: `index` must be within bounds.
  public mutating func updateValue(at index: Int, to newValue: Value) {
    precondition(index >= 0 && index < elements.count, "Index out of bounds")
    elements[index].value = newValue
  }

  /// Updates the key at the specified position.
  /// This method changes the key while preserving the value and position.
  /// - Parameters:
  ///   - index: The position of the key to update. Must be valid (0..<count).
  ///   - newKey: The new key to store at the position.
  /// - Precondition: `index` must be within bounds.
  public mutating func updateKey(at index: Int, to newKey: Key) {
    precondition(index >= 0 && index < elements.count, "Index out of bounds")

    let oldKey = elements[index].key

    // Remove this index from old key's indices
    if var indices = keyIndices[oldKey] {
      indices.removeAll { $0 == index }
      if indices.isEmpty {
        keyIndices[oldKey] = nil
      }
      else {
        keyIndices[oldKey] = indices
      }
    }

    // Update the key
    elements[index].key = newKey

    // Add this index to new key's indices
    if keyIndices[newKey] != nil {
      keyIndices[newKey]?.append(index)
    }
    else {
      keyIndices[newKey] = [index]
    }
  }

  /// Removes all key-value pairs with the specified key.
  /// - Parameter key: The key to remove.
  public mutating func removeAll(forKey key: Key) {
    guard let indices = keyIndices[key] else { return }

    // Remove in reverse order to maintain valid indices
    for index in indices.sorted().reversed() {
      elements.remove(at: index)
    }

    // Rebuild index map since indices have shifted
    rebuildIndices()
  }

  /// Removes the first entry for the given key and returns its value.
  ///
  /// Only removes the first occurrence of the key, leaving any duplicates intact.
  ///
  /// - Parameter key: The key to remove.
  /// - Returns: The first value associated with the key, or `nil` if the key was not present.
  @discardableResult
  public mutating func removeFirst(forKey key: Key) -> Value? {
    guard let firstIndex = firstIndex(forKey: key) else {
      return nil
    }
    let value = elements[firstIndex].value
    remove(at: firstIndex)
    return value
  }

  /// Removes the key-value pair at the specified position.
  /// - Parameter index: The position of the element to remove.
  /// - Precondition: `index` must be within bounds.
  public mutating func remove(at index: Int) {
    precondition(index >= 0 && index < elements.count, "Index out of bounds")
    elements.remove(at: index)
    rebuildIndices()
  }

  /// Removes all key-value pairs from the dictionary.
  public mutating func removeAll() {
    elements.removeAll()
    keyIndices.removeAll()
  }

  /// Rebuilds the key index map after structural changes.
  private mutating func rebuildIndices() {
    keyIndices.removeAll()
    for (index, element) in elements.enumerated() {
      if keyIndices[element.key] != nil {
        keyIndices[element.key]?.append(index)
      }
      else {
        keyIndices[element.key] = [index]
      }
    }
  }

  /// Returns an array of all keys in insertion order (including duplicates).
  public var keys: [Key] {
    elements.map { $0.key }
  }

  /// Returns an array of all values in insertion order.
  public var values: [Value] {
    elements.map { $0.value }
  }

  /// Returns a set of unique keys.
  public var uniqueKeys: Set<Key> {
    Set(keyIndices.keys)
  }

  /// Returns the index of the first occurrence of the given key.
  ///
  /// - Parameter key: The key to find.
  /// - Returns: The index of the first occurrence, or `nil` if the key is not present.
  public func firstIndex(forKey key: Key) -> Int? {
    guard let indices = keyIndices[key], let firstIndex = indices.first else {
      return nil
    }
    return firstIndex
  }

  /// Returns all indices where the given key appears.
  ///
  /// - Parameter key: The key to find.
  /// - Returns: An array of indices where the key appears, in order.
  public func indices(forKey key: Key) -> [Int] {
    keyIndices[key] ?? []
  }
}

// MARK: - Functional Methods (Non-Mutating)

extension OrderedMultiDictionary {
  /// Returns a new dictionary with the key-value pair appended.
  ///
  /// This is the non-mutating version of `append(_:_:)`.
  ///
  /// - Parameters:
  ///   - key: The key to append.
  ///   - value: The value to append.
  /// - Returns: A new dictionary with the pair appended.
  public func appending(_ key: Key, _ value: Value) -> OrderedMultiDictionary {
    var copy = self
    copy.append(key, value)
    return copy
  }

  /// Returns a new dictionary with the specified value updated at the given position.
  ///
  /// This is the non-mutating version of `updateValue(at:to:)`.
  ///
  /// - Parameters:
  ///   - index: The position of the value to update.
  ///   - newValue: The new value to store.
  /// - Returns: A new dictionary with the value updated.
  /// - Precondition: `index` must be within bounds.
  public func updatingValue(at index: Int, to newValue: Value) -> OrderedMultiDictionary {
    var copy = self
    copy.updateValue(at: index, to: newValue)
    return copy
  }

  /// Returns a new dictionary with the specified key updated at the given position.
  ///
  /// This is the non-mutating version of `updateKey(at:to:)`.
  ///
  /// - Parameters:
  ///   - index: The position of the key to update.
  ///   - newKey: The new key to store.
  /// - Returns: A new dictionary with the key updated.
  /// - Precondition: `index` must be within bounds.
  public func updatingKey(at index: Int, to newKey: Key) -> OrderedMultiDictionary {
    var copy = self
    copy.updateKey(at: index, to: newKey)
    return copy
  }

  /// Returns a new dictionary with all entries for the specified key removed.
  ///
  /// This is the non-mutating version of `removeAll(forKey:)`.
  ///
  /// - Parameter key: The key to remove.
  /// - Returns: A new dictionary with all entries for the key removed.
  public func removingAll(forKey key: Key) -> OrderedMultiDictionary {
    var copy = self
    copy.removeAll(forKey: key)
    return copy
  }

  /// Returns a new dictionary with the element at the specified position removed.
  ///
  /// This is the non-mutating version of `remove(at:)`.
  ///
  /// - Parameter index: The position of the element to remove.
  /// - Returns: A new dictionary with the element removed.
  /// - Precondition: `index` must be within bounds.
  public func removing(at index: Int) -> OrderedMultiDictionary {
    var copy = self
    copy.remove(at: index)
    return copy
  }

  /// Returns a new dictionary with the value for the given key set or updated.
  ///
  /// If the key exists, only the first occurrence is updated.
  /// If the key doesn't exist, a new entry is appended.
  ///
  /// - Parameters:
  ///   - key: The key to set or update.
  ///   - value: The value to associate with the key.
  /// - Returns: A new dictionary with the value set.
  public func setting(_ key: Key, to value: Value) -> OrderedMultiDictionary {
    var copy = self
    copy[key] = value
    return copy
  }
}

// MARK: - Sequence

extension OrderedMultiDictionary: Sequence {
  public func makeIterator() -> IndexingIterator<[(key: Key, value: Value)]> {
    elements.makeIterator()
  }
}

// MARK: - Collection

extension OrderedMultiDictionary: Collection {
  public typealias Index = Int

  public var startIndex: Int {
    elements.startIndex
  }

  public var endIndex: Int {
    elements.endIndex
  }

  public func index(after i: Int) -> Int {
    elements.index(after: i)
  }

  public subscript(position: Int) -> (key: Key, value: Value) {
    elements[position]
  }
}

// MARK: - ExpressibleByDictionaryLiteral

extension OrderedMultiDictionary: ExpressibleByDictionaryLiteral {
  /// Creates an ordered multi-dictionary from a dictionary literal.
  ///
  /// Note: Dictionary literals do not preserve order and cannot express duplicate keys.
  /// For these features, use `append(_:_:)` or `init(_:)` with a sequence.
  public init(dictionaryLiteral elements: (Key, Value)...) {
    self.init(elements)
  }
}

// MARK: - Equatable

extension OrderedMultiDictionary: Equatable where Value: Equatable {
  public static func == (lhs: OrderedMultiDictionary<Key, Value>, rhs: OrderedMultiDictionary<Key, Value>) -> Bool {
    // Two multi-dictionaries are equal if they have the same elements in the same order
    guard lhs.elements.count == rhs.elements.count else { return false }
    for (lhs, rhs) in zip(lhs.elements, rhs.elements) {
      if lhs.key != rhs.key || lhs.value != rhs.value {
        return false
      }
    }
    return true
  }
}

// MARK: - Hashable

extension OrderedMultiDictionary: Hashable where Value: Hashable {
  public func hash(into hasher: inout Hasher) {
    // Hash all elements in order
    for element in elements {
      hasher.combine(element.key)
      hasher.combine(element.value)
    }
  }
}

// MARK: - Codable

extension OrderedMultiDictionary: Codable where Key: Codable, Value: Codable {
  private struct Pair: Decodable {
    let key: Key
    let value: Value

    init(from decoder: Decoder) throws {
      var container = try decoder.unkeyedContainer()

      // Empty arrays are invalid for Pair (handled by filtering in init)
      guard !container.isAtEnd else {
        throw DecodingError.dataCorrupted(
          DecodingError.Context(
            codingPath: decoder.codingPath,
            debugDescription: "Cannot decode empty array as key-value pair"
          )
        )
      }
      key = try container.decode(Key.self)
      // Handle lenient parsing for single-element arrays
      if container.isAtEnd {
        guard
          let defaultable = Value.self as? any SingleElementDecodable.Type,
          let defaultValue = defaultable.defaultSingleElementValue as? Value
        else {
          throw DecodingError.dataCorrupted(
            DecodingError.Context(
              codingPath: decoder.codingPath,
              debugDescription: "Single-element array requires Value type to conform to SingleElementDecodable"
            )
          )
        }
        value = defaultValue
      }
      else {
        value = try container.decode(Value.self)
      }
    }
  }

  public init(from decoder: Decoder) throws {
    self.init()
    let container = try decoder.singleValueContainer()
    let pairs = try container.decode([Pair].self)

    for pair in pairs {
      append(pair.key, pair.value)
    }
  }

  public func encode(to encoder: Encoder) throws {
    var outerContainer = encoder.unkeyedContainer()

    for (key, value) in elements {
      var innerContainer = outerContainer.nestedUnkeyedContainer()
      try innerContainer.encode(key)
      try innerContainer.encode(value)
    }
  }
}

// MARK: - CustomStringConvertible

extension OrderedMultiDictionary: CustomStringConvertible {
  public var description: String {
    let pairs = elements.map { "\($0.key): \($0.value)" }.joined(separator: ", ")
    return "[\(pairs)]"
  }
}

// MARK: - CustomDebugStringConvertible

extension OrderedMultiDictionary: CustomDebugStringConvertible {
  public var debugDescription: String {
    let pairs = elements.map { "(\($0.key), \($0.value))" }.joined(separator: ", ")
    return "OrderedMultiDictionary([\(pairs)])"
  }
}

// MARK: - Sendable

extension OrderedMultiDictionary: Sendable where Key: Sendable, Value: Sendable {}
