public extension Node {
  /// Sets the tab item for a tab view
  /// - Parameters:
  ///   - systemName: SF Symbol name for the tab icon
  ///   - text: Label text for the tab
  func tabItem(_ systemName: String? = nil, text: String? = nil) -> Node {
    var dict: [AttributeKey: AttributeValue] = [:]
    if let systemName = systemName {
      dict[.systemName] = .string(systemName)
    }
    if let text = text {
      dict[.text] = .string(text)
    }
    return addingAttribute(.tabItem, value: .dict(dict))
  }

  /// Sets the tab item from a dictionary
  /// - Parameter dict: Dictionary with systemName and/or text keys
  func tabItem(_ dict: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.tabItem, value: .dict(dict))
  }

  /// Tags a view for identification (useful in TabView)
  /// - Parameter tag: Tag value (string or int)
  func tag(_ tag: String) -> Node {
    addingAttribute(.tag, value: .string(tag))
  }

  /// Tags a view with an integer
  /// - Parameter tag: Integer tag value
  func tag(_ tag: Int) -> Node {
    addingAttribute(.tag, value: .number(Double(tag)))
  }

  /// Sets the style for a TabView
  /// - Parameter style: The tab view style (automatic or page)
  func tabViewStyle(_ style: TabViewStyle) -> Node {
    addingAttribute(.tabViewStyle, value: .string(style.rawValue))
  }

  /// Adds a badge with a string label
  /// - Parameter label: The badge label text
  func badge(_ label: String) -> Node {
    addingAttribute(.badge, value: .string(label))
  }

  /// Adds a badge with an integer count
  /// - Parameter count: The badge count
  func badge(_ count: Int) -> Node {
    addingAttribute(.badge, value: .number(Double(count)))
  }
}
