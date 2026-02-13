/// Creates an angular gradient node with evenly-distributed colors (conic/conical gradient)
/// - Parameters:
///   - colors: Array of color strings (hex or named colors)
///   - center: Center point of the gradient (default: .center)
///   - startAngle: Starting angle in degrees (default: 0°, pointing right)
///   - endAngle: Ending angle in degrees (default: 360°, full circle)
/// - Returns: A Node representing an AngularGradient
public func AngularGradientNode(
  colors: [String],
  center: Node.UnitPoint = .center,
  startAngle: Double = 0,
  endAngle: Double = 360
) -> Node {
  var attributes: Node.Attributes = [
    .colors: .array(colors.map { .string($0) })
  ]

  attributes[.center] = .string(center.rawValue)
  attributes[.startAngle] = .number(startAngle)
  attributes[.endAngle] = .number(endAngle)

  return Node(
    type: .angularGradient,
    attributes: attributes
  )
}

/// Creates an angular gradient node with precise color stop positions
/// - Parameters:
///   - colorStops: Array of ColorStop tuples where location is 0.0-1.0
///   - center: Center point of the gradient (default: .center)
///   - startAngle: Starting angle in degrees (default: 0°, pointing right)
///   - endAngle: Ending angle in degrees (default: 360°, full circle)
/// - Returns: A Node representing an AngularGradient with color stops
public func AngularGradientNode(
  colorStops: [Node.ColorStop],
  center: Node.UnitPoint = .center,
  startAngle: Double = 0,
  endAngle: Double = 360
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
  attributes[.startAngle] = .number(startAngle)
  attributes[.endAngle] = .number(endAngle)

  return Node(
    type: .angularGradient,
    attributes: attributes
  )
}
