import Foundation

public struct Layout: Codable, Hashable {
  public typealias Styles = [String: Node.Attributes]
  var styles: Styles
  var content: Node
  
  static let inherit = "inherit"

  public init(styles: Styles, content: Node) {
    self.styles = styles
    self.content = content
  }

  public init (styles: Styles, @NodeBuilder content: () -> [Node]) {
    self.styles = styles
    self.content = VStackNode(content: content)
  }

  public func resolve() -> Node {
    let resolvedStyles = resolveStyleInheritance(styles: styles)
    return applyStyles(to: content, styles: resolvedStyles)
  }

  private func resolveStyleInheritance(styles: [String: Node.Attributes]) -> [String: Node.Attributes] {
    var resolved: [String: Node.Attributes] = [:]
    var inProgress: Set<String> = []
    
    func resolveStyle(_ styleName: String) -> Node.Attributes {
      // If already resolved, return it
      if let resolvedAttrs = resolved[styleName] {
        return resolvedAttrs
      }
      
      // Get the style attributes
      guard let attributes = styles[styleName] else {
        return [:]
      }
      
      // Check for circular dependency
      guard !inProgress.contains(styleName) else {
        // Circular dependency detected, just return attributes without inherit
        var attrs = attributes
        attrs.removeFirst(forKey: .inherit)
        return attrs
      }
      
      // Mark as in progress
      inProgress.insert(styleName)
      
      var resolvedAttributes = attributes
      guard
        let inheritKey = attributes[.inherit]?.string,
        styles[inheritKey] != nil
      else {
        // No valid inheritance, just remove the inherit key if it exists
        resolvedAttributes.removeFirst(forKey: .inherit)
        resolved[styleName] = resolvedAttributes
        inProgress.remove(styleName)
        return resolvedAttributes
      }
      
      // Recursively resolve parent first
      let parentAttrs = resolveStyle(inheritKey)
      
      // Collect all child attributes (excluding inherit) - these take precedence
      var childAttrs: [AttributeKey: AttributeValue] = [:]
      for (key, value) in attributes where key != .inherit {
        childAttrs[key] = value
      }
      
      // Merge parent attributes with current (current overrides parent)
      // Replace inherit key in place with parent attributes
      var merged: Node.Attributes = [:]
      for (key, value) in attributes {
        if key == .inherit {
          // Replace inherit with parent attributes (but only where child doesn't have them)
          for (parentKey, parentValue) in parentAttrs where childAttrs[parentKey] == nil {
            merged[parentKey] = parentValue
          }
        }
        else {
          // Always use child's attribute value
          merged[key] = value
        }
      }
      
      resolved[styleName] = merged
      inProgress.remove(styleName)
      return merged
    }
    
    // Resolve all styles
    for styleName in styles.keys {
      _ = resolveStyle(styleName)
    }
    
    return resolved
  }

  private func applyStyles(to node: Node, styles: [String: Node.Attributes]) -> Node {
    var resolvedAttributes = node.attributes
    // Check if this node references a style
    if let styleName = node.attributes[.style]?.string, let styleAttributes = styles[styleName] {
      // Merge style attributes with current (current overrides style)
      // Replace style key in place with style attributes
      var merged: Node.Attributes = [:]
      for (key, value) in node.attributes {
        if key == .style {
          // Replace style with style attributes
          for (styleKey, styleValue) in styleAttributes where merged[styleKey] == nil {
            merged[styleKey] = styleValue
          }
        }
        else if merged[key] == nil {
          // Keep current attribute if not already added (from style)
          merged[key] = value
        }
      }
      resolvedAttributes = merged
    }
    else {
      // No valid style reference, just remove the style key if it exists
      resolvedAttributes.removeAll(forKey: .style)
    }
    // Recursively apply styles to children
    let resolvedChildren = node.children?.map { applyStyles(to: $0, styles: styles) }
    return Node(
      type: node.type,
      attributes: resolvedAttributes,
      children: resolvedChildren
    )
  }
}
