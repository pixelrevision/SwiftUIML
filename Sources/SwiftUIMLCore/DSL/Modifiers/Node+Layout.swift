public extension Node {
  /// Creates an id for the node
  /// - Parameter value: The id
  func id(_ value: String) -> Node {
    addingAttribute(.id, value: .string(value))
  }

  /// Adds padding to the node
  /// - Parameter amount: The padding amount (applied to all edges)
  func padding(_ amount: Double) -> Node {
    addingAttribute(.padding, value: .number(amount))
  }
  
  func padding() -> Node {
    addingAttribute(.padding, value: .null)
  }

  /// Adds padding to the node with specific edges
  /// - Parameters:
  ///   - top: Top padding
  ///   - leading: Leading padding
  ///   - bottom: Bottom padding
  ///   - trailing: Trailing padding
  func padding(top: Double = 0, leading: Double = 0, bottom: Double = 0, trailing: Double = 0) -> Node {
    addingAttribute(.padding, value: [
      .top: .number(top),
      .leading: .number(leading),
      .bottom: .number(bottom),
      .trailing: .number(trailing),
    ])
  }

  /// Sets the frame of the node
  /// - Parameters:
  ///   - width: Fixed width
  ///   - height: Fixed height
  ///   - alignment: Alignment within the frame
  func frame(width: Double? = nil, height: Double? = nil, alignment: Alignment? = nil) -> Node {
    var dict: [AttributeKey: AttributeValue] = [:]
    if let width = width { dict[.width] = .number(width) }
    if let height = height { dict[.height] = .number(height) }
    if let alignment = alignment { dict[.alignment] = .string(alignment.rawValue) }
    return addingAttribute(.frame, value: .dict(dict))
  }

  /// Sets the frame of the node with min/max constraints
  /// - Parameters:
  ///   - minWidth: Minimum width
  ///   - idealWidth: Ideal width
  ///   - maxWidth: Maximum width
  ///   - minHeight: Minimum height
  ///   - idealHeight: Ideal height
  ///   - maxHeight: Maximum height
  ///   - alignment: Alignment within the frame
  func frame(
    minWidth: Double? = nil,
    idealWidth: Double? = nil,
    maxWidth: Double? = nil,
    minHeight: Double? = nil,
    idealHeight: Double? = nil,
    maxHeight: Double? = nil,
    alignment: Alignment? = nil
  ) -> Node {
    var dict: [AttributeKey: AttributeValue] = [:]
    if let minWidth = minWidth { dict[.minWidth] = .number(minWidth) }
    if let idealWidth = idealWidth { dict[.idealWidth] = .number(idealWidth) }
    if let maxWidth = maxWidth { dict[.maxWidth] = .number(maxWidth) }
    if let minHeight = minHeight { dict[.minHeight] = .number(minHeight) }
    if let idealHeight = idealHeight { dict[.idealHeight] = .number(idealHeight) }
    if let maxHeight = maxHeight { dict[.maxHeight] = .number(maxHeight) }
    if let alignment = alignment { dict[.alignment] = .string(alignment.rawValue) }
    return addingAttribute(.frame, value: .dict(dict))
  }

  /// Sets a container-relative frame with count-based sizing
  /// - Parameters:
  ///   - axes: The axes to apply the frame to
  ///   - count: Number of items in the container
  ///   - span: Number of items this view should span
  ///   - spacing: Spacing between items
  ///   - alignment: Alignment within the frame
  func containerRelativeFrame(
    _ axes: AxisSet,
    count: Int,
    span: Int = 1,
    spacing: Double = 0,
    alignment: Alignment = .center
  ) -> Node {
    var dict: [AttributeKey: AttributeValue] = [:]
    dict[.axis] = .string(axes.stringValue)
    dict[.init("count")] = .number(Double(count))
    dict[.init("span")] = .number(Double(span))
    dict[.spacing] = .number(spacing)
    dict[.alignment] = .string(alignment.rawValue)
    return addingAttribute(.containerRelativeFrame, value: .dict(dict))
  }

  /// Fixes the size of the view in both dimensions
  func fixedSize() -> Node {
    addingAttribute(.fixedSize, value: .bool(true))
  }

  /// Fixes the size of the view in specific dimensions
  /// - Parameters:
  ///   - horizontal: Whether to fix horizontal size
  ///   - vertical: Whether to fix vertical size
  func fixedSize(horizontal: Bool, vertical: Bool) -> Node {
    addingAttribute(.fixedSize, value: [
      .horizontal: .bool(horizontal),
      .vertical: .bool(vertical),
    ])
  }

  /// Offsets the node by the specified x and y amounts
  /// - Parameters:
  ///   - x: Horizontal offset
  ///   - y: Vertical offset
  func offset(x: Double = 0, y: Double = 0) -> Node {
    addingAttribute(.offset, value: [
      .x: .number(x),
      .y: .number(y),
    ])
  }

  /// Offsets the node by the specified amount
  /// - Parameters:
  ///   - value: Value for both axis
  func offset(_ value: Double) -> Node {
    addingAttribute(.offset, value: .number(value))
  }

  /// Positions the node at the specified x and y coordinates
  /// - Parameters:
  ///   - x: Horizontal position
  ///   - y: Vertical position
  func position(x: Double, y: Double) -> Node {
    addingAttribute(.position, value: [
      .x: .number(x),
      .y: .number(y),
    ])
  }

  /// Rotates the node by the specified angle in degrees
  /// - Parameters:
  ///   - degrees: Rotation angle in degrees
  ///   - anchor: The anchor point for the rotation (defaults to center)
  func rotationEffect(degrees: Double, anchor: Alignment = .center) -> Node {
    addingAttribute(.rotationEffect, value: [
      .degrees: .number(degrees),
      .anchor: .string(anchor.rawValue),
    ])
  }

  /// Rotates the node by the specified angle in radians
  /// - Parameters:
  ///   - radians: Rotation angle in radians
  ///   - anchor: The anchor point for the rotation (defaults to center)
  func rotationEffect(radians: Double, anchor: Alignment = .center) -> Node {
    addingAttribute(.rotationEffect, value: [
      .radians: .number(radians),
      .anchor: .string(anchor.rawValue),
    ])
  }

  /// Scales the node uniformly
  /// - Parameter scale: The scale factor
  func scaleEffect(_ scale: Double) -> Node {
    addingAttribute(.scaleEffect, value: .number(scale))
  }

  /// Scales the node with separate x and y factors
  /// - Parameters:
  ///   - x: Horizontal scale factor
  ///   - y: Vertical scale factor
  ///   - anchor: The anchor point for the scale (defaults to center)
  func scaleEffect(x: Double = 1, y: Double = 1, anchor: Alignment = .center) -> Node {
    addingAttribute(.scaleEffect, value: [
      .x: .number(x),
      .y: .number(y),
      .anchor: .string(anchor.rawValue),
    ])
  }

  /// Rotates the node in 3D space by the specified angle in degrees
  /// - Parameters:
  ///   - degrees: Rotation angle in degrees
  ///   - axis: The axis of rotation (x, y, z)
  ///   - anchor: The anchor point for the rotation (defaults to center)
  ///   - anchorZ: The z-coordinate of the anchor point (defaults to 0)
  ///   - perspective: The perspective value (defaults to 1)
  func rotation3DEffect(
    degrees: Double,
    axis: (x: Double, y: Double, z: Double),
    anchor: Alignment = .center,
    anchorZ: Double = 0,
    perspective: Double = 1
  ) -> Node {
    addingAttribute(.rotation3DEffect, value: [
      .degrees: .number(degrees),
      .x: .number(axis.x),
      .y: .number(axis.y),
      .z: .number(axis.z),
      .anchor: .string(anchor.rawValue),
      .anchorZ: .number(anchorZ),
      .perspective: .number(perspective),
    ])
  }

  /// Rotates the node in 3D space by the specified angle in radians
  /// - Parameters:
  ///   - radians: Rotation angle in radians
  ///   - axis: The axis of rotation (x, y, z)
  ///   - anchor: The anchor point for the rotation (defaults to center)
  ///   - anchorZ: The z-coordinate of the anchor point (defaults to 0)
  ///   - perspective: The perspective value (defaults to 1)
  func rotation3DEffect(
    radians: Double,
    axis: (x: Double, y: Double, z: Double),
    anchor: Alignment = .center,
    anchorZ: Double = 0,
    perspective: Double = 1
  ) -> Node {
    addingAttribute(.rotation3DEffect, value: [
      .radians: .number(radians),
      .x: .number(axis.x),
      .y: .number(axis.y),
      .z: .number(axis.z),
      .anchor: .string(anchor.rawValue),
      .anchorZ: .number(anchorZ),
      .perspective: .number(perspective),
    ])
  }

  /// Applies a perspective transformation to the node
  /// - Parameter value: The perspective value (lower values create more pronounced perspective)
  func perspective(_ value: Double) -> Node {
    addingAttribute(.perspective, value: .number(value))
  }

  /// Sets the number of columns this grid cell should span
  /// - Parameter count: Number of columns to span
  func gridCellColumns(_ count: Int) -> Node {
    addingAttribute(.gridCellColumns, value: .number(Double(count)))
  }

  /// Sets the layout priority for this view
  /// - Parameter priority: The layout priority (higher values get more space)
  func layoutPriority(_ priority: Double) -> Node {
    addingAttribute(.layoutPriority, value: .number(priority))
  }

  /// Assigns a name to the view's coordinate space
  /// - Parameter name: The name for this coordinate space
  func coordinateSpace(_ name: String) -> Node {
    addingAttribute(.coordinateSpace, value: .string(name))
  }

  /// Adds a custom safe area inset with content
  /// - Parameters:
  ///   - edge: The edge to add the inset to
  ///   - alignment: Alignment of the content within the inset
  ///   - spacing: Spacing between the inset and main content
  ///   - content: The content to display in the safe area inset
  func safeAreaInset(
    edge: SafeAreaRegion,
    alignment: Alignment = .center,
    spacing: Double? = nil,
    content: Node
  ) -> Node {
    var dict: [AttributeKey: AttributeValue] = [
      .init("edge"): .string(edge.rawValue),
      .alignment: .string(alignment.rawValue),
      .content: .node(content),
    ]
    if let spacing = spacing {
      dict[.spacing] = .number(spacing)
    }
    return addingAttribute(.safeAreaInset, value: .dict(dict))
  }

  /// Adds responsive breakpoint-based attributes
  /// - Parameter breakpoints: KeyValuePairs of Breakpoint to Attributes (insertion order preserved)
  ///
  /// Serializes as array of objects: `[{pattern: "w>=200", attrs: {...}}, ...]`
  ///
  /// Example:
  /// ```
  /// .responsive([
  ///   .sm: [.font: "body", .padding: 8],
  ///   .md: [.font: "title", .padding: 16],
  ///   .w(800) + .h(1024): [.hidden: true]
  /// ])
  /// ```
  func responsive(_ breakpoints: KeyValuePairs<Breakpoint, Node.Attributes>) -> Node {
    // Convert to array of dicts: [{pattern: "w>=200", attributes: [...]}, ...]
    // Each dict has "pattern" (string) and "attributes" (2D array: [["key", value], ...])
    // KeyValuePairs preserves insertion order from dictionary literals
    let breakpointArray = breakpoints.map { bp, attrs -> AttributeValue in
      let attrsArray = attrs.map { AttributeValue.array([AttributeValue.string($0.key.rawValue), $0.value]) }
      return .dict([
        .init("pattern"): .string(bp.pattern),
        .init("attributes"): .array(attrsArray),
      ])
    }
    return addingAttribute(.responsive, value: .array(breakpointArray))
  }

  /// Adds a style to resolve at this index of the attributes
  /// - Parameter value: The name of the style to use
  func style(_ value: String) -> Node {
    return addingAttribute(.style, value: .string(value))
  }

  /// Adds a toolbar with content
  /// - Parameter content: The toolbar content builder
  func toolbar(@NodeBuilder _ content: () -> [Node]) -> Node {
    // Wrap children in a container node
    let toolbarNode = Node(type: .toolbarContent, children: content())
    return addingAttribute(.toolbar, value: .node(toolbarNode))
  }

  /// Sets the current value label for a Gauge (String)
  /// - Parameter label: Text to display as the current value label
  func currentValueLabel(_ label: String) -> Node {
    addingAttribute(.currentValueLabel, value: .node(TextNode(label)))
  }

  /// Sets the current value label for a Gauge (Node)
  /// - Parameter label: Node to display as the current value label
  func currentValueLabel(_ label: Node) -> Node {
    addingAttribute(.currentValueLabel, value: .node(label))
  }

  /// Sets the minimum value label for a Gauge (String)
  /// - Parameter label: Text to display as the minimum value label
  func minimumValueLabel(_ label: String) -> Node {
    addingAttribute(.minimumValueLabel, value: .node(TextNode(label)))
  }

  /// Sets the minimum value label for a Gauge (Node)
  /// - Parameter label: Node to display as the minimum value label
  func minimumValueLabel(_ label: Node) -> Node {
    addingAttribute(.minimumValueLabel, value: .node(label))
  }

  /// Sets the maximum value label for a Gauge (String)
  /// - Parameter label: Text to display as the maximum value label
  func maximumValueLabel(_ label: String) -> Node {
    addingAttribute(.maximumValueLabel, value: .node(TextNode(label)))
  }

  /// Sets the maximum value label for a Gauge (Node)
  /// - Parameter label: Node to display as the maximum value label
  func maximumValueLabel(_ label: Node) -> Node {
    addingAttribute(.maximumValueLabel, value: .node(label))
  }
}
