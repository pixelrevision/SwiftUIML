/// Creates a gauge view that displays a value within a range
/// - Parameters:
///   - label: The label for the gauge
///   - value: The current value to display
///   - minimumValue: The minimum value of the range (default: 0)
///   - maximumValue: The maximum value of the range (default: 1)
/// - Returns: A node representing a Gauge
public func GaugeNode(
  _ label: String,
  value: Double,
  minimumValue: Double = 0,
  maximumValue: Double = 1
) -> Node {
  Node(
    type: .gauge,
    attributes: [
      .label: .string(label),
      .value: .number(value),
      .minimumValue: .number(minimumValue),
      .maximumValue: .number(maximumValue),
    ]
  )
}

/// Creates a gauge view that displays a value within a range with a custom label node
/// - Parameters:
///   - value: The current value to display
///   - minimumValue: The minimum value of the range (default: 0)
///   - maximumValue: The maximum value of the range (default: 1)
///   - label: A label for the gauge
/// - Returns: A node representing a Gauge
public func GaugeNode(
  value: Double,
  minimumValue: Double = 0,
  maximumValue: Double = 1,
  label: () -> Node
) -> Node {
  Node(
    type: .gauge,
    attributes: [
      .label: .node(label()),
      .value: .number(value),
      .minimumValue: .number(minimumValue),
      .maximumValue: .number(maximumValue),
    ]
  )
}
