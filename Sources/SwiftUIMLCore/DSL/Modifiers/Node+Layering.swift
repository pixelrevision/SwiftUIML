public extension Node {
  /// Layers a view on top with default center alignment
  /// - Parameter overlay: Node to display as overlay
  func overlay(_ overlay: Node) -> Node {
    addingAttribute(.overlay, value: .node(overlay))
  }

  /// Layers a view on top with specified alignment
  /// - Parameters:
  ///   - overlay: Node to display as overlay
  ///   - alignment: Position of the overlay
  func overlay(_ overlay: Node, alignment: Alignment) -> Node {
    addingAttribute(.overlay, value: [
      .value: .node(overlay),
      .alignment: .string(alignment.rawValue),
    ])
  }

  /// Layers a view behind this view
  /// - Parameter background: Node to display as background
  func background(_ background: Node) -> Node {
    addingAttribute(.background, value: .node(background))
  }

  /// Layers a view behind with specified alignment
  /// - Parameters:
  ///   - background: Node to display as background
  ///   - alignment: Position of the background
  func background(_ background: Node, alignment: Alignment) -> Node {
    addingAttribute(.background, value: [
      .value: .node(background),
      .alignment: .string(alignment.rawValue),
    ])
  }

  /// Masks this view using the alpha channel of the given node
  /// - Parameter mask: Node to use as mask
  func mask(_ mask: Node) -> Node {
    addingAttribute(.mask, value: .node(mask))
  }

  /// Masks this view using the alpha channel of the given node with alignment
  /// - Parameters:
  ///   - mask: Node to use as mask
  ///   - alignment: Position of the mask
  func mask(_ mask: Node, alignment: Alignment) -> Node {
    addingAttribute(.mask, value: [
      .value: .node(mask),
      .alignment: .string(alignment.rawValue),
    ])
  }

  /// Clips this view to a shape node
  /// - Parameter shape: The shape node to clip to
  func clipShape(_ shape: Node) -> Node {
    addingAttribute(.clipShape, value: .node(shape))
  }

  /// Fills a shape with a color
  /// - Parameter color: Color string (hex or name)
  /// - Note: Cannot be combined with `.stroke()` - fill takes precedence
  func fill(_ color: String) -> Node {
    addingAttribute(.fill, value: .string(color))
  }

  /// Fills a shape with a gradient or other view
  /// - Parameter fill: Node to use as fill (gradient, color, etc.)
  /// - Note: Cannot be combined with `.stroke()` - fill takes precedence
  func fill(_ fill: Node) -> Node {
    addingAttribute(.fill, value: .node(fill))
  }

  /// Strokes a shape with a color
  /// - Parameter color: Color string (hex or name)
  /// - Note: Cannot be combined with `.fill()` - only one will be applied
  func stroke(_ color: String) -> Node {
    addingAttribute(.stroke, value: .string(color))
  }

  /// Strokes a shape with a color and line width
  /// - Parameters:
  ///   - color: Color string (hex or name)
  ///   - lineWidth: Width of the stroke
  /// - Note: Cannot be combined with `.fill()` - only one will be applied
  func stroke(_ color: String, lineWidth: Double) -> Node {
    addingAttribute(.stroke, value: [
      .color: .string(color),
      .lineWidth: .number(lineWidth),
    ])
  }

  /// Trims a shape to a portion of its path
  /// - Parameter to: The end of the trim (0.0 to 1.0), with from defaulting to 0.0
  /// - Note: Useful for progress indicators and animations
  func trim(to: Double) -> Node {
    addingAttribute(.trim, value: .number(to))
  }

  /// Trims a shape to a portion of its path
  /// - Parameters:
  ///   - from: The start of the trim (0.0 to 1.0)
  ///   - to: The end of the trim (0.0 to 1.0)
  /// - Note: Useful for progress indicators and animations
  func trim(from: Double, to: Double) -> Node {
    addingAttribute(.trim, value: [
      .from: .number(from),
      .to: .number(to),
    ])
  }
}
