public extension Node {
  /// Sets the foreground color
  /// - Parameter color: Color string (hex, name, or gradient)
  func foregroundColor(_ color: String) -> Node {
    addingAttribute(.foregroundColor, value: .string(color))
  }

  /// Sets the background color
  /// - Parameter color: Color string (hex, name, or gradient)
  func backgroundColor(_ color: String) -> Node {
    addingAttribute(.backgroundColor, value: .string(color))
  }

  /// Adds a tint
  /// - Parameters:
  ///   - color: The color to use as a tint
  func tint(_ color: String) -> Node {
    addingAttribute(.tint, value: .string(color))
  }

  /// Sets the preferred color scheme for this view
  /// - Parameter scheme: ColorScheme enum value
  func colorScheme(_ scheme: ColorScheme) -> Node {
    addingAttribute(.colorScheme, value: .string(scheme.rawValue))
  }

  /// Sets the preferred color scheme for the user interface
  /// - Parameter scheme: ColorScheme enum value
  func preferredColorScheme(_ scheme: ColorScheme) -> Node {
    addingAttribute(.preferredColorScheme, value: .string(scheme.rawValue))
  }

  /// Adds color scheme conditional attributes (light/dark mode variations)
  /// - Parameter schemes: Dictionary mapping color scheme to attributes
  ///
  /// Serializes as: `{light: [...], dark: [...]}`
  ///
  /// Example:
  /// ```
  /// AsyncImageNode(url: "default.jpg")
  ///   .colorSchemeConditional([
  ///     .light: [.url: .string("light-image.jpg")],
  ///     .dark: [.url: .string("dark-image.jpg")]
  ///   ])
  /// ```
  func colorSchemeConditional(_ schemes: [ColorScheme: Node.Attributes]) -> Node {
    // Convert ColorScheme enum keys to AttributeKey string keys
    let schemesDict: [AttributeKey: AttributeValue] = Dictionary(
      uniqueKeysWithValues: schemes.map { scheme, attrs in
        let attrsArray = attrs.flatMap { [AttributeValue.string($0.key.rawValue), $0.value] }
        return (.init(scheme.rawValue), .array(attrsArray))
      }
    )
    return addingAttribute(.colorSchemeConditional, value: .dict(schemesDict))
  }
}
