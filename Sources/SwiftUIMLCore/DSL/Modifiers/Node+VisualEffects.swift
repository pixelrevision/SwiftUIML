public extension Node {
  /// Sets the opacity
  /// - Parameter opacity: Opacity value (0.0 to 1.0)
  func opacity(_ opacity: Double) -> Node {
    addingAttribute(.opacity, value: .number(opacity))
  }

  /// Sets the blend mode for compositing
  /// - Parameter mode: The blend mode to apply
  func blendMode(_ mode: BlendMode) -> Node {
    addingAttribute(.blendMode, value: .string(mode.rawValue))
  }

  /// Sets the corner radius
  /// - Parameter radius: Corner radius value
  func cornerRadius(_ radius: Double) -> Node {
    addingAttribute(.cornerRadius, value: .number(radius))
  }

  /// Hides the node
  func hidden() -> Node {
    addingAttribute(.hidden, value: .bool(true))
  }

  /// Applies a redaction effect to the view
  /// - Parameter reason: The reason for redaction (.placeholder for loading states, .privacy for sensitive content)
  func redacted(reason: RedactionReasons) -> Node {
    addingAttribute(.redacted, value: .string(reason.rawValue))
  }

  /// Marks the view as privacy-sensitive (hidden in screenshots/screen recordings)
  /// - Parameter sensitive: Whether the content is privacy-sensitive (defaults to true)
  func privacySensitive(_ sensitive: Bool = true) -> Node {
    addingAttribute(.privacySensitive, value: .bool(sensitive))
  }

  /// Clips the node to its bounds
  func clipped() -> Node {
    addingAttribute(.clipped, value: .bool(true))
  }

  /// Ignores safe area on all edges
  func ignoresSafeArea() -> Node {
    addingAttribute(.ignoresSafeArea, value: .bool(true))
  }

  /// Ignores safe area on specified edges
  /// - Parameter edges: Edge set (.all, .top, .bottom, .leading, .trailing, .horizontal, .vertical)
  func ignoresSafeArea(_ edges: Edge) -> Node {
    addingAttribute(.ignoresSafeArea, value: .string(edges.rawValue))
  }

  /// Adds a border
  /// - Parameters:
  ///   - color: Border color string
  ///   - width: Border width
  func border(_ color: String, width: Double) -> Node {
    addingAttribute(.border, value: [
      .color: .string(color),
      .width: .number(width),
    ])
  }

  /// Adds a shadow
  /// - Parameters:
  ///   - color: Shadow color string
  ///   - radius: Shadow blur radius
  ///   - x: Horizontal offset
  ///   - y: Vertical offset
  func shadow(color: String, radius: Double = 5, x: Double = 0, y: Double = 0) -> Node {
    addingAttribute(.shadow, value: [
      .color: .string(color),
      .radius: .number(radius),
      .x: .number(x),
      .y: .number(y),
    ])
  }

  /// Adds a blur effect
  /// - Parameter radius: Blur radius
  func blur(_ radius: Double) -> Node {
    addingAttribute(.blur, value: .number(radius))
  }

  /// Adds a blur effect with opacity control
  /// - Parameters:
  ///   - radius: Blur radius
  ///   - opaque: Whether the blur should be opaque
  func blur(_ radius: Double, opaque: Bool) -> Node {
    addingAttribute(.blur, value: .dict([
      .radius: .number(radius),
      .opaque: .bool(opaque),
    ]))
  }

  /// Adjusts the brightness
  /// - Parameter amount: Brightness adjustment (-1.0 to 1.0, where 0 is no change)
  func brightness(_ amount: Double) -> Node {
    addingAttribute(.brightness, value: .number(amount))
  }

  /// Adjusts the contrast
  /// - Parameter amount: Contrast adjustment (0.0 to infinity, where 1.0 is no change)
  func contrast(_ amount: Double) -> Node {
    addingAttribute(.contrast, value: .number(amount))
  }

  /// Adjusts the saturation
  /// - Parameter amount: Saturation adjustment (0.0 to infinity, where 1.0 is no change, 0.0 is grayscale)
  func saturation(_ amount: Double) -> Node {
    addingAttribute(.saturation, value: .number(amount))
  }

  /// Applies a grayscale effect
  /// - Parameter amount: Grayscale amount (0.0 to 1.0, where 0.0 is no effect and 1.0 is fully grayscale)
  func grayscale(_ amount: Double) -> Node {
    addingAttribute(.grayscale, value: .number(amount))
  }

  /// Rotates the hue of the view
  /// - Parameter angle: Rotation angle
  func hueRotation(_ angle: Angle) -> Node {
    addingAttribute(.hueRotation, value: angle.attributeValue)
  }

  /// Inverts the colors of the view
  func colorInvert() -> Node {
    addingAttribute(.colorInvert, value: .bool(true))
  }

  /// Converts luminance values to alpha transparency
  func luminanceToAlpha() -> Node {
    addingAttribute(.luminanceToAlpha, value: .bool(true))
  }

  /// Multiplies the view's colors by the specified color
  /// - Parameter color: Color string to multiply with
  func colorMultiply(_ color: String) -> Node {
    addingAttribute(.colorMultiply, value: .string(color))
  }

  /// Rotates the hue of the view
  /// - Parameter degrees: Rotation angle
  func hueRotation(_ degrees: Double) -> Node {
    addingAttribute(.hueRotation, value: .number(degrees))
  }

  /// Sets the text field style
  /// - Parameter style: The text field style
  func textFieldStyle(_ style: TextFieldStyle) -> Node {
    addingAttribute(.textFieldStyle, value: .string(style.rawValue))
  }

  /// Sets the button style
  /// - Parameter style: The button style
  func buttonStyle(_ style: ButtonStyle) -> Node {
    addingAttribute(.buttonStyle, value: .string(style.rawValue))
  }

  /// Sets the progress view style
  /// - Parameter style: The progress view style
  func progressViewStyle(_ style: ProgressViewStyle) -> Node {
    addingAttribute(.progressViewStyle, value: .string(style.rawValue))
  }

  /// Sets the list style
  /// - Parameter style: The list style
  func listStyle(_ style: ListStyle) -> Node {
    addingAttribute(.listStyle, value: .string(style.rawValue))
  }

  /// Sets the toggle style
  /// - Parameter style: The toggle style
  func toggleStyle(_ style: ToggleStyle) -> Node {
    addingAttribute(.toggleStyle, value: .string(style.rawValue))
  }

  /// Sets the picker style
  /// - Parameter style: The picker style
  func pickerStyle(_ style: PickerStyle) -> Node {
    addingAttribute(.pickerStyle, value: .string(style.rawValue))
  }

  /// Hides the labels of controls
  func labelsHidden() -> Node {
    addingAttribute(.labelsHidden, value: .bool(true))
  }

  /// Sets the button border shape
  /// - Parameter shape: The button border shape
  func buttonBorderShape(_ shape: ButtonBorderShape) -> Node {
    addingAttribute(.buttonBorderShape, value: .string(shape.rawValue))
  }
}
