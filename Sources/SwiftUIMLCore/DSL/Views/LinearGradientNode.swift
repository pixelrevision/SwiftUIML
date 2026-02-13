/// Creates a linear gradient node with evenly-distributed colors
/// - Parameters:
///   - colors: Array of color strings (hex or named colors)
///   - startPoint: Starting point of the gradient (default: .top)
///   - endPoint: Ending point of the gradient (default: .bottom)
/// - Returns: A Node representing a LinearGradient
public func LinearGradientNode(
  colors: [String],
  startPoint: Node.UnitPoint = .top,
  endPoint: Node.UnitPoint = .bottom
) -> Node {
  var attributes: Node.Attributes = [
    .colors: .array(colors.map { .string($0) })
  ]

  attributes[.startPoint] = .string(startPoint.rawValue)
  attributes[.endPoint] = .string(endPoint.rawValue)

  return Node(
    type: .linearGradient,
    attributes: attributes
  )
}

/// Creates a linear gradient node with precise color stop positions
/// - Parameters:
///   - colorStops: Array of ColorStop tuples where location is 0.0-1.0
///   - startPoint: Starting point of the gradient (default: .top)
///   - endPoint: Ending point of the gradient (default: .bottom)
/// - Returns: A Node representing a LinearGradient with color stops
public func LinearGradientNode(
  colorStops: [Node.ColorStop],
  startPoint: Node.UnitPoint = .top,
  endPoint: Node.UnitPoint = .bottom
) -> Node {
  let stops = colorStops.map { stop in
    AttributeValue.dict([
      .color: .string(stop.color),
      .location: .number(stop.location),
    ])
  }

  var attributes: Node.Attributes = [
    .colorStops: .array(stops)
  ]

  attributes[.startPoint] = .string(startPoint.rawValue)
  attributes[.endPoint] = .string(endPoint.rawValue)

  return Node(
    type: .linearGradient,
    attributes: attributes
  )
}
