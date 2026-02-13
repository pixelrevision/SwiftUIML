import Foundation
import SwiftUI

extension Node {
  /// Returns a formatted plain string representation of the node tree
  /// - Returns: A formatted string with proper indentation and structure
  public func formatted() -> String {
    return formatNode(self, indent: 0)
  }
  
  /// Returns a formatted attributed string with styling
  /// - Returns: An AttributedString with colors and formatting applied
  public func formattedAttributed() -> AttributedString {
    return formatNodeAttributed(self, indent: 0)
  }

  public func jsonFormatted(_ encoder: JSONEncoder? = nil) -> String {
    let encoder = encoder ?? Self.prettyJSONEncoder()
    do {
      let encoded = try encoder.encode(self)
      return String(data: encoded, encoding: .utf8) ?? "{}"
    }
    catch {
      return "{\"error\": \"\(error.localizedDescription)\"}"
    }
  }

  private static func prettyJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    return encoder
  }
  
  private func formatNode(_ node: Node, indent: Int) -> String {
    let indentStr = String(repeating: "  ", count: indent)
    var output = ""
    
    // Node type
    output += "\(indentStr)type: \(node.type.rawValue)\n"
    
    // Attributes
    if !node.attributes.isEmpty {
      output += "\(indentStr)attributes:\n"
      for (key, value) in node.attributes {
        output += formatAttribute(key: key, value: value, indent: indent + 1)
      }
    }
    
    // Children
    if let children = node.children, !children.isEmpty {
      output += "\(indentStr)children:\n"
      for child in children {
        output += formatNode(child, indent: indent + 1)
      }
    }
    
    return output
  }
  
  private func formatAttribute(key: AttributeKey, value: AttributeValue, indent: Int) -> String {
    let indentStr = String(repeating: "  ", count: indent)
    
    if case .dict(let dict) = value {
      var output = "\(indentStr)\(key.rawValue):\n"
      for (k, v) in dict {
        output += formatAttribute(key: k, value: v, indent: indent + 1)
      }
      return output
    }
    else if case .array(let arr) = value {
      // Special case: if this is "attributes" and looks like a flat array [key, val, key, val, ...]
      // convert it to an ordered dictionary for better display
      if key == .attributes, let orderedDict = value.orderedDict {
        var output = "\(indentStr)\(key.rawValue):\n"
        for (k, v) in orderedDict {
          output += formatAttribute(key: k, value: v, indent: indent + 1)
        }
        return output
      }
      
      var output = "\(indentStr)\(key.rawValue):\n"
      for item in arr {
        output += formatArrayItem(item, indent: indent + 1)
      }
      return output
    }
    else if case .node(let node) = value {
      // Recursively format nested node as a full node tree
      var output = "\(indentStr)\(key.rawValue):\n"
      output += formatNode(node, indent: indent + 1)
      return output
    }
    else {
      return "\(indentStr)\(key.rawValue): \(formatValue(value))\n"
    }
  }
  
  private func formatArrayItem(_ value: AttributeValue, indent: Int) -> String {
    let indentStr = String(repeating: "  ", count: indent)
    
    if case .dict(let dict) = value {
      var output = ""
      for (k, v) in dict {
        output += formatAttribute(key: k, value: v, indent: indent)
      }
      return output
    }
    else if case .array(let arr) = value {
      var output = "\(indentStr)- \n"
      for item in arr {
        output += formatArrayItem(item, indent: indent + 1)
      }
      return output
    }
    else if case .node(let node) = value {
      // Format node in array as a full node tree with "- " prefix
      var output = "\(indentStr)- \n"
      output += formatNode(node, indent: indent + 1)
      return output
    }
    else {
      return "\(indentStr)- \(formatValue(value))\n"
    }
  }
  
  private func formatValue(_ value: AttributeValue) -> String {
    switch value {
    case .string(let str):
      return "\"\(str)\""
    case .number(let num):
      return "\(num)"
    case .bool(let bool):
      return bool ? "true" : "false"
    case .array:
      return "[...]"
    case .dict:
      return "{...}"
    case .node(let node):
      return "<Node: \(node.type.rawValue) id:\(node.id.prefix(8))>"
    case .null:
      return "null"
    }
  }

  private func formatNodeAttributed(_ node: Node, indent: Int) -> AttributedString {
    let indentStr = String(repeating: "  ", count: indent)
    var output = AttributedString()
    
    // Node type
    output += AttributedString(indentStr)
    output += styled("type: ", .label)
    output += styled(node.type.rawValue, .nodeType)
    output += AttributedString("\n")
    
    // Attributes
    if !node.attributes.isEmpty {
      output += AttributedString(indentStr)
      output += styled("attributes:", .label)
      output += AttributedString("\n")
      for (key, value) in node.attributes {
        output += formatAttributeAttributed(key: key, value: value, indent: indent + 1)
      }
    }
    
    // Children
    if let children = node.children, !children.isEmpty {
      output += AttributedString(indentStr)
      output += styled("children:", .label)
      output += AttributedString("\n")
      for child in children {
        output += formatNodeAttributed(child, indent: indent + 1)
      }
    }
    
    return output
  }
  
  private func formatAttributeAttributed(key: AttributeKey, value: AttributeValue, indent: Int) -> AttributedString {
    let indentStr = String(repeating: "  ", count: indent)
    
    if case .dict(let dict) = value {
      var output = AttributedString(indentStr)
      output += styled(key.rawValue, .attributeKey)
      output += styled(":", .label)
      output += AttributedString("\n")
      for (k, v) in dict {
        output += formatAttributeAttributed(key: k, value: v, indent: indent + 1)
      }
      return output
    }
    else if case .array(let arr) = value {
      // Special case: if this is "attributes" and looks like a flat array [key, val, key, val, ...]
      // convert it to an ordered dictionary for better display
      if key == .attributes, let orderedDict = value.orderedDict {
        var output = AttributedString(indentStr)
        output += styled(key.rawValue, .attributeKey)
        output += styled(":", .label)
        output += AttributedString("\n")
        for (k, v) in orderedDict {
          output += formatAttributeAttributed(key: k, value: v, indent: indent + 1)
        }
        return output
      }
      
      var output = AttributedString(indentStr)
      output += styled(key.rawValue, .attributeKey)
      output += styled(":", .label)
      output += AttributedString("\n")
      for item in arr {
        output += formatArrayItemAttributed(item, indent: indent + 1)
      }
      return output
    }
    else if case .node(let node) = value {
      // Recursively format nested node as a full node tree
      var output = AttributedString(indentStr)
      output += styled(key.rawValue, .attributeKey)
      output += styled(":", .label)
      output += AttributedString("\n")
      output += formatNodeAttributed(node, indent: indent + 1)
      return output
    }
    else {
      var output = AttributedString(indentStr)
      output += styled(key.rawValue, .attributeKey)
      output += styled(": ", .label)
      output += formatValueAttributed(value)
      output += AttributedString("\n")
      return output
    }
  }
  
  private func formatArrayItemAttributed(_ value: AttributeValue, indent: Int) -> AttributedString {
    let indentStr = String(repeating: "  ", count: indent)
    
    if case .dict(let dict) = value {
      var output = AttributedString()
      for (k, v) in dict {
        output += formatAttributeAttributed(key: k, value: v, indent: indent)
      }
      return output
    }
    else if case .array(let arr) = value {
      var output = AttributedString(indentStr)
      output += styled("- ", .label)
      output += AttributedString("\n")
      for item in arr {
        output += formatArrayItemAttributed(item, indent: indent + 1)
      }
      return output
    }
    else if case .node(let node) = value {
      // Format node in array as a full node tree with "- " prefix
      var output = AttributedString(indentStr)
      output += styled("- ", .label)
      output += AttributedString("\n")
      output += formatNodeAttributed(node, indent: indent + 1)
      return output
    }
    else {
      var output = AttributedString(indentStr)
      output += styled("- ", .label)
      output += formatValueAttributed(value)
      output += AttributedString("\n")
      return output
    }
  }
  
  private func formatValueAttributed(_ value: AttributeValue) -> AttributedString {
    switch value {
    case .string(let str):
      return styled("\"\(str)\"", .string)
    case .number(let num):
      return styled("\(num)", .number)
    case .bool(let bool):
      return styled(bool ? "true" : "false", .bool)
    case .array:
      return styled("[...]", .array)
    case .dict:
      return styled("{...}", .dict)
    case .node(let node):
      return styled("<Node: \(node.type.rawValue) id:\(node.id.prefix(8))>", .nodeType)
    case .null:
      return styled("null", .null)
    }
  }
  
  private enum StyleType {
    case label        // "type:", "attributes:", etc.
    case nodeType     // "text", "hstack"
    case attributeKey // "padding", "font"
    case string       // "value"
    case number       // 42
    case bool         // true/false
    case array        // [...]
    case dict         // {...}
    case null         // null
  }
  
  private func styled(_ text: String, _ type: StyleType) -> AttributedString {
    var attr = AttributedString(text)
    
    switch type {
    case .label:
      attr.foregroundColor = .purple
    case .nodeType:
      attr.foregroundColor = .blue
      attr.font = .system(.body, design: .monospaced).weight(.semibold)
    case .attributeKey:
      attr.foregroundColor = .cyan
      attr.font = .system(.body, design: .monospaced).weight(.medium)
    case .string:
      attr.foregroundColor = .green
    case .number:
      attr.foregroundColor = .orange
    case .bool:
      attr.foregroundColor = .pink
    case .array, .dict:
      attr.foregroundColor = .yellow
    case .null:
      attr.foregroundColor = .gray
    }
    
    // Set base font if not already set
    if attr.font == nil {
      attr.font = .system(.body, design: .monospaced)
    }
    
    return attr
  }
}
