import Foundation

public enum AttributeValue: Codable, Sendable {
  case string(String)
  case number(Double)
  case bool(Bool)
  case array([AttributeValue])
  case dict([AttributeKey: AttributeValue])
  case node(Node)
  case null

  public init(_ value: String) {
    self = .string(value)
  }

  public init(_ value: Double) {
    self = .number(value)
  }

  public init(_ value: Int) {
    self = .number(Double(value))
  }

  public init(_ value: Bool) {
    self = .bool(value)
  }

  public init(_ values: [AttributeValue]) {
    self = .array(values)
  }

  public init(_ dict: [AttributeKey: AttributeValue]) {
    self = .dict(dict)
  }

  // Dictionary with string keys
  public init(_ dict: [String: AttributeValue]) {
    self = .dict(Dictionary(uniqueKeysWithValues: dict.map { (AttributeKey($0.key), $0.value) }))
  }
  
  public init(_ node: Node) {
    self = .node(node)
  }

  // Nullable init
  public init?(_ value: Any?) {
    guard let value = value else {
      self = .null
      return
    }

    switch value {
    case let string as String:
      self = .string(string)
    case let number as Double:
      self = .number(number)
    case let number as Int:
      self = .number(Double(number))
    case let bool as Bool:
      self = .bool(bool)
    case let array as [AttributeValue]:
      self = .array(array)
    case let dict as [AttributeKey: AttributeValue]:
      self = .dict(dict)
    case let dict as [String: AttributeValue]:
      self = .dict(Dictionary(uniqueKeysWithValues: dict.map { (AttributeKey($0.key), $0.value) }))
    case let node as Node:
      self = .node(node)
    default:
      return nil
    }
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    // Try node first (check for $type discriminator)
    if let wrapper = try? container.decode(NodeWrapper.self) {
      self = .node(wrapper.value)
      return
    }
    if let string = try? container.decode(String.self) {
      self = Self.decodeSpecialNumericString(string)
    }
    else if let number = try? container.decode(Double.self) {
      self = .number(number)
    }
    else if let bool = try? container.decode(Bool.self) {
      self = .bool(bool)
    }
    else if let array = try? container.decode([AttributeValue].self) {
      self = .array(array)
    }
    else if let stringKeyDict = try? container.decode([String: AttributeValue].self) {
      let dict = Dictionary(uniqueKeysWithValues: stringKeyDict.map { (AttributeKey($0.key), $0.value) })
      self = .dict(dict)
    }
    else {
      self = .null
    }
  }

  /// Decodes a string that may represent a special numeric value
  private static func decodeSpecialNumericString(_ string: String) -> AttributeValue {
    switch string {
    case "$infinity":
      return .number(.infinity)
    case "$-infinity":
      return .number(-.infinity)
    case "$nan":
      return .number(.nan)
    default:
      return .string(string)
    }
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .string(let value):
      try container.encode(value)
    case .number(let value):
      try Self.encodeNumber(value, to: &container)
    case .bool(let value):
      try container.encode(value)
    case .array(let value):
      try container.encode(value)
    case .dict(let value):
      let stringKeyDict = Dictionary(uniqueKeysWithValues: value.map { ($0.key.rawValue, $0.value) })
      try container.encode(stringKeyDict)
    case .node(let node):
      let wrapper = NodeWrapper(value: node)
      try container.encode(wrapper)
    case .null:
      try container.encodeNil()
    }
  }

  /// Encodes a number, handling special floating-point values
  private static func encodeNumber(_ value: Double, to container: inout SingleValueEncodingContainer) throws {
    if value.isInfinite {
      if value.sign == .minus {
        try container.encode("$-infinity")
      }
      else {
        try container.encode("$infinity")
      }
    }
    else if value.isNaN {
      try container.encode("$nan")
    }
    else {
      try container.encode(value)
    }
  }
  
  private struct NodeWrapper: Codable {
    let type: String
    let value: Node
    
    init(value: Node) {
      self.type = "node"
      self.value = value
    }
    
    enum CodingKeys: String, CodingKey {
      case type = "$type"
      case value
    }
  }

  public var string: String? {
    switch self {
    case .string(let string): string
    case .number(let double): String(double)
    case .bool(let bool): bool ? "true" : "false"
    default: nil
    }
  }

  public var url: URL? {
    switch self {
    case .string(let string):
      guard let url = URL(string: string) else {
        return nil
      }
      return url
    default:
      return nil
    }
  }

  public var int: Int? {
    switch self {
    case .string(let string): Int(string)
    case .number(let double): Int(double)
    default: nil
    }
  }

  public var float: Double? {
    switch self {
    case .string(let string): Double(string)
    case .number(let double): Double(double)
    default: nil
    }
  }
  
  public var cgFloat: CGFloat? {
    switch self {
    case .string(let string): cgFloat(from: string)
    case .number(let double): CGFloat(double)
    default: nil
    }
  }

  private func cgFloat(from string: String) -> CGFloat? {
    switch string {
    case "$infinity":
      return .infinity
    case "$-infinity":
      return -.infinity
    case "$nan":
      return .nan
    default:
      if let value = Double(string) {
        return CGFloat(value)
      }
      return nil
    }
  }

  public var bool: Bool? {
    switch self {
    case .string(let string):
      if string == "true" {
        return true
      }
      else if string == "false" {
        return false
      }
      else {
        return nil
      }
    case .number(let double): return double == 0 ? false : true
    case .bool(let bool): return bool
    default: return nil
    }
  }

  public var array: [AttributeValue]? {
    switch self {
    case .array(let array): array
    default: nil
    }
  }

  public var dict: [AttributeKey: AttributeValue]? {
    switch self {
    case .dict(let dict): dict
    default: nil
    }
  }
  
  public var node: Node? {
    switch self {
    case .node(let node): node
    default: nil
    }
  }
}

extension AttributeValue: ExpressibleByStringLiteral {
  public init(stringLiteral value: String) {
    self = .string(value)
  }
}

extension AttributeValue: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: Int) {
    self = .number(Double(value))
  }
}

extension AttributeValue: ExpressibleByFloatLiteral {
  public init(floatLiteral value: Double) {
    self = .number(value)
  }
}

extension AttributeValue: ExpressibleByBooleanLiteral {
  public init(booleanLiteral value: Bool) {
    self = .bool(value)
  }
}

extension AttributeValue: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: AttributeValue...) {
    self = .array(elements)
  }
}

extension AttributeValue: ExpressibleByDictionaryLiteral {
  public init(dictionaryLiteral elements: (AttributeKey, AttributeValue)...) {
    let dict = Dictionary(uniqueKeysWithValues: elements.map { (AttributeKey($0.0.rawValue), $0.1) })
    self = .dict(dict)
  }
}

extension AttributeValue: ExpressibleByNilLiteral {
  public init(nilLiteral: ()) {
    self = .null
  }
}

extension AttributeValue: SingleElementDecodable {
  public static var defaultSingleElementValue: AttributeValue {
    .bool(true)
  }
}

extension AttributeValue: Hashable {
  public func hash(into hasher: inout Hasher) {
    switch self {
    case .string(let value):
      hasher.combine(0)
      hasher.combine(value)
    case .number(let value):
      hasher.combine(1)
      hasher.combine(value)
    case .bool(let value):
      hasher.combine(2)
      hasher.combine(value)
    case .array(let value):
      hasher.combine(3)
      hasher.combine(value)
    case .dict(let value):
      hasher.combine(4)
      hasher.combine(value)
    case .node(let node):
      hasher.combine(5)
      // Only hash the node's ID to avoid deep recursion during hashing
      // (hashing is called upfront for dictionary keys, so we keep it shallow)
      hasher.combine(node.id)
    case .null:
      hasher.combine(6)
    }
  }
  
  public static func == (lhs: AttributeValue, rhs: AttributeValue) -> Bool {
    switch (lhs, rhs) {
    case (.string(let l), .string(let r)):
      return l == r
    case (.number(let l), .number(let r)):
      return l == r
    case (.bool(let l), .bool(let r)):
      return l == r
    case (.array(let l), .array(let r)):
      return l == r
    case (.dict(let l), .dict(let r)):
      return l == r
    case (.node(let l), .node(let r)):
      // Full structural comparison - this recursion is safe because:
      // 1. Nodes form a tree (no cycles)
      // 2. Recursion depth = tree depth (typically 5-10 levels)
      // 3. Only called when actually comparing, not upfront like hashing
      return l.type == r.type &&
        l.children == r.children &&
        l.attributes == r.attributes
    case (.null, .null):
      return true
    default:
      return false
    }
  }
}
