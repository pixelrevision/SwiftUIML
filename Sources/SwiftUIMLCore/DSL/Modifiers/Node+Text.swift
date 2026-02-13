public extension Node {
  /// Sets the font using a text style
  /// - Parameter style: Font style
  func font(_ style: FontStyle) -> Node {
    addingAttribute(.font, value: .string(style.rawValue))
  }

  /// Sets a system font
  /// - Parameters:
  ///   - size: Font size
  ///   - weight: Font weight
  ///   - design: Font design
  func font(size: Double, weight: FontWeight? = nil, design: FontDesign? = nil) -> Node {
    var dict: [AttributeKey: AttributeValue] = [
      .type: .string("system"),
      .size: .number(size),
    ]
    if let weight = weight { dict[.weight] = .string(weight.rawValue) }
    if let design = design { dict[.design] = .string(design.rawValue) }
    return addingAttribute(.font, value: .dict(dict))
  }

  /// Sets a custom font
  /// - Parameters:
  ///   - name: Custom font name
  ///   - size: Font size
  ///   - relativeTo: Text style to scale relative to
  func customFont(name: String, size: Double, relativeTo: FontStyle? = nil) -> Node {
    var dict: [AttributeKey: AttributeValue] = [
      .name: .string(name),
      .size: .number(size),
    ]
    if let relativeTo = relativeTo { dict[.relativeTo] = .string(relativeTo.rawValue) }
    return addingAttribute(.font, value: .dict(dict))
  }

  /// Sets a custom font with fixed size
  /// - Parameters:
  ///   - name: Custom font name
  ///   - fixedSize: Fixed font size
  func customFont(name: String, fixedSize: Double) -> Node {
    addingAttribute(.font, value: [
      .name: .string(name),
      .fixedSize: .number(fixedSize),
    ])
  }

  /// Sets the line limit
  /// - Parameter limit: Maximum number of lines
  func lineLimit(_ limit: Int) -> Node {
    addingAttribute(.lineLimit, value: .number(Double(limit)))
  }

  /// Sets the multiline text alignment
  /// - Parameter alignment: Text alignment
  func multilineTextAlignment(_ alignment: TextAlignment) -> Node {
    addingAttribute(.multilineTextAlignment, value: .string(alignment.rawValue))
  }

  /// Makes text bold
  func bold() -> Node {
    addingAttribute(.bold, value: .bool(true))
  }

  /// Makes text italic
  func italic() -> Node {
    addingAttribute(.italic, value: .bool(true))
  }

  /// Adds underline to text
  func underline() -> Node {
    addingAttribute(.underline, value: .bool(true))
  }

  /// Adds underline to text with optional color
  /// - Parameters:
  ///   - isActive: Whether the underline is active
  ///   - color: Optional underline color
  func underline(_ isActive: Bool = true, color: String? = nil) -> Node {
    var dict: [AttributeKey: AttributeValue] = [
      .isActive: .bool(isActive)
    ]
    if let color = color {
      dict[.color] = .string(color)
    }
    return addingAttribute(.underline, value: .dict(dict))
  }

  /// Adds strikethrough to text
  func strikethrough() -> Node {
    addingAttribute(.strikethrough, value: .bool(true))
  }

  /// Adds strikethrough to text with optional color
  /// - Parameters:
  ///   - isActive: Whether the strikethrough is active
  ///   - color: Optional strikethrough color
  func strikethrough(_ isActive: Bool = true, color: String? = nil) -> Node {
    var dict: [AttributeKey: AttributeValue] = [
      .isActive: .bool(isActive)
    ]
    if let color = color {
      dict[.color] = .string(color)
    }
    return addingAttribute(.strikethrough, value: .dict(dict))
  }

  /// Sets the kerning (character spacing)
  /// - Parameter kerning: The spacing between characters
  func kerning(_ kerning: Double) -> Node {
    addingAttribute(.kerning, value: .number(kerning))
  }

  /// Sets the tracking (character spacing)
  /// - Parameter tracking: The spacing between characters
  func tracking(_ tracking: Double) -> Node {
    addingAttribute(.tracking, value: .number(tracking))
  }

  /// Sets the line spacing (vertical spacing between lines)
  /// - Parameter spacing: The spacing between lines
  func lineSpacing(_ spacing: Double) -> Node {
    addingAttribute(.lineSpacing, value: .number(spacing))
  }

  /// Sets the font weight
  /// - Parameter weight: Font weight
  func fontWeight(_ weight: FontWeight) -> Node {
    addingAttribute(.fontWeight, value: .string(weight.rawValue))
  }

  /// Enables or disables text selection
  /// - Parameter selection: Text selection behavior
  func textSelection(_ selection: TextSelection) -> Node {
    addingAttribute(.textSelection, value: .string(selection.rawValue))
  }

  /// Sets the truncation mode for text
  /// - Parameter mode: The truncation mode (head, tail, or middle)
  func truncationMode(_ mode: TruncationMode) -> Node {
    addingAttribute(.truncationMode, value: .string(mode.rawValue))
  }

  /// Sets the minimum scale factor for text
  /// - Parameter factor: The minimum scale factor (0.0 to 1.0)
  func minimumScaleFactor(_ factor: Double) -> Node {
    addingAttribute(.minimumScaleFactor, value: .number(factor))
  }

  /// Enables text tightening to fit within available space
  /// - Parameter allows: Whether to allow tightening (default: true)
  func allowsTightening(_ allows: Bool = true) -> Node {
    addingAttribute(.allowsTightening, value: .bool(allows))
  }

  /// Sets the vertical offset from the baseline
  /// - Parameter offset: The offset in points (positive moves up, negative moves down)
  func baselineOffset(_ offset: Double) -> Node {
    addingAttribute(.baselineOffset, value: .number(offset))
  }
}
