public extension Node {
  /// Animates changes to the specified attribute
  /// - Parameters:
  ///   - animation: The animation to apply
  ///   - attribute: The attribute key to watch for changes
  /// - Returns: A new node with the animation modifier
  func animation(_ animation: AnimationValue, attribute: AttributeKey) -> Node {
    guard case .dict(var animDict) = animation.toAttributeValue() else {
      return self
    }

    // Add the attribute key to the animation dict
    animDict[.attribute] = .string(attribute.rawValue)
    return addingAttribute(.animation, value: .dict(animDict))
  }

  /// Animates changes to the specified attribute
  /// - Parameters:
  ///   - animation: The animation to apply
  ///   - attribute: The attribute name to watch for changes
  /// - Returns: A new node with the animation modifier
  func animation(_ animation: AnimationValue, attribute: String) -> Node {
    self.animation(animation, attribute: AttributeKey(attribute))
  }
}
