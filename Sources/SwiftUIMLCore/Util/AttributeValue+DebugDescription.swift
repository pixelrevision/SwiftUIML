import Foundation

extension AttributeValue: CustomDebugStringConvertible {
  public var debugDescription: String {
    formatValue(self, indent: 0)
  }

  private func formatValue(_ value: AttributeValue, indent: Int) -> String {
    let indentStr = String(repeating: "  ", count: indent)
    let nextIndentStr = String(repeating: "  ", count: indent + 1)

    switch value {
    case .string(let str):
      return "\"\(str)\""
    case .number(let num):
      // Format nicely - remove .0 for whole numbers
      if num.truncatingRemainder(dividingBy: 1) == 0 {
        return String(Int(num))
      }
      else {
        return String(num)
      }
    case .bool(let bool):
      return bool ? "true" : "false"
    case .null:
      return "null"
    case .array(let arr):
      if arr.isEmpty {
        return "[]"
      }
      let items = arr.map { formatValue($0, indent: indent + 1) }
      // Use inline format for simple arrays
      if shouldUseInlineFormat(arr) {
        return "[\(items.joined(separator: ", "))]"
      }
      // Multi-line format
      let formattedItems = items.map { "\(nextIndentStr)\($0)" }.joined(separator: ",\n")
      return "[\n\(formattedItems)\n\(indentStr)]"
    case .dict(let dict):
      if dict.isEmpty {
        return "{}"
      }
      let sortedKeys = dict.keys.sorted { $0.rawValue < $1.rawValue }
      let items = sortedKeys.compactMap { key -> String? in
        guard let value = dict[key] else { return nil }
        let valueStr = formatValue(value, indent: indent + 1)
        return "\(nextIndentStr)\(key.rawValue): \(valueStr)"
      }
      return "{\n\(items.joined(separator: ",\n"))\n\(indentStr)}"
    case .node(let node):
      // Format nested node with its type and ID for debugging
      return "<Node: \(node.type.rawValue) id:\(node.id.prefix(8))>"
    }
  }

  /// Determines if an array should be formatted inline (single line)
  private func shouldUseInlineFormat(_ arr: [AttributeValue]) -> Bool {
    // Arrays with only primitives and short length use inline format
    guard arr.count <= 5 else { return false }
    for item in arr {
      switch item {
      case .array, .dict, .node:
        return false
      case .string(let str):
        if str.count > 20 {
          return false
        }
      default:
        break
      }
    }
    return true
  }
}

extension AttributeValue {
  /// Pretty-printed debug string with custom indentation
  public func prettyPrint(indent: Int = 0) -> String {
    formatValue(self, indent: indent)
  }
}
