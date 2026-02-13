public extension Node {
  /// Sets the accessibility label
  /// - Parameter label: Accessibility label text
  func accessibilityLabel(_ label: String) -> Node {
    addingAttribute(.accessibilityLabel, value: .string(label))
  }

  /// Sets the accessibility hint
  /// - Parameter hint: Accessibility hint text
  func accessibilityHint(_ hint: String) -> Node {
    addingAttribute(.accessibilityHint, value: .string(hint))
  }

  /// Sets the accessibility value
  /// - Parameter value: Accessibility value text
  func accessibilityValue(_ value: String) -> Node {
    addingAttribute(.accessibilityValue, value: .string(value))
  }

  /// Sets the accessibility identifier
  /// - Parameter identifier: Accessibility identifier
  func accessibilityIdentifier(_ identifier: String) -> Node {
    addingAttribute(.accessibilityIdentifier, value: .string(identifier))
  }

  /// Hides the element from accessibility
  /// - Parameter hidden: Whether to hide from accessibility
  func accessibilityHidden(_ hidden: Bool = true) -> Node {
    addingAttribute(.accessibilityHidden, value: .bool(hidden))
  }

  /// Adds accessibility traits
  /// - Parameter trait: Single accessibility trait
  func accessibilityTraits(_ trait: String) -> Node {
    addingAttribute(.accessibilityTraits, value: .string(trait))
  }

  /// Adds multiple accessibility traits
  /// - Parameter traits: Array of accessibility trait strings
  func accessibilityTraits(_ traits: [String]) -> Node {
    addingAttribute(.accessibilityTraits, value: .array(traits.map { .string($0) }))
  }

  /// Removes a single accessibility trait
  /// - Parameter trait: Accessibility trait to remove
  func accessibilityRemoveTraits(_ trait: String) -> Node {
    addingAttribute(.accessibilityRemoveTraits, value: .string(trait))
  }

  /// Removes multiple accessibility traits
  /// - Parameter traits: Array of accessibility traits to remove
  func accessibilityRemoveTraits(_ traits: [String]) -> Node {
    addingAttribute(.accessibilityRemoveTraits, value: .array(traits.map { .string($0) }))
  }

  /// Sets the accessibility sort priority
  /// - Parameter priority: Sort priority for ordering accessibility elements (higher = earlier)
  func accessibilitySortPriority(_ priority: Double) -> Node {
    addingAttribute(.accessibilitySortPriority, value: .number(priority))
  }

  /// Configures how accessibility treats child elements
  /// - Parameter children: Strategy for child elements
  func accessibilityElement(children: AccessibilityChildBehavior) -> Node {
    addingAttribute(.accessibilityElement, value: .string(children.rawValue))
  }

  /// Provides alternative input labels for voice control
  /// - Parameter labels: Array of alternative labels
  func accessibilityInputLabels(_ labels: [String]) -> Node {
    addingAttribute(.accessibilityInputLabels, value: .array(labels.map { .string($0) }))
  }

  /// Adds a custom accessibility action
  /// - Parameters:
  ///   - named: Name of the custom action
  ///   - message: Message to send when action is triggered
  func accessibilityAction(named: String, message: AttributeValue) -> Node {
    addingAttribute(.accessibilityAction, value: [
      .name: .string(named),
      .message: message,
    ])
  }
}
