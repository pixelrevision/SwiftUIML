/// Creates a radial gradient node with evenly-distributed colors
/// - Parameters:
///   - colors: Array of color strings (hex or named colors)
///   - center: Center point of the gradient (default: .center)
///   - startRadius: Starting radius in points (default: 0)
///   - endRadius: Ending radius in points (default: 300)
/// - Returns: A Node representing a RadialGradient
public func RadialGradientNode(
  colors: [String],
  center: Node.UnitPoint = .center,
  startRadius: Double = 0,
  endRadius: Double = 300
) -> Node {
  var attributes: Node.Attributes = [
    .colors: .array(colors.map { .string($0) })
  ]
  attributes[.center] = .string(center.rawValue)
  attributes[.startRadius] = .number(startRadius)
  attributes[.endRadius] = .number(endRadius)

  return Node(
    type: .radialGradient,
    attributes: attributes
  )
}

/// Creates a radial gradient node with precise color stop positions
/// - Parameters:
///   - colorStops: Array of ColorStop tuples where location is 0.0-1.0
///   - center: Center point of the gradient (default: .center)
///   - startRadius: Starting radius in points (default: 0)
///   - endRadius: Ending radius in points (default: 300)
/// - Returns: A Node representing a RadialGradient with color stops
public func RadialGradientNode(
  colorStops: [Node.ColorStop],
  center: Node.UnitPoint = .center,
  startRadius: Double = 0,
  endRadius: Double = 300
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
  attributes[.center] = .string(center.rawValue)
  attributes[.startRadius] = .number(startRadius)
  attributes[.endRadius] = .number(endRadius)

  return Node(
    type: .radialGradient,
    attributes: attributes
  )
}
