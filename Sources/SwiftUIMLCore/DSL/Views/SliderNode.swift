/// Creates a slider
/// Use .onSliderChange() modifier for message handling
public func SliderNode(
  value: Double = 0.5,
  minimumValue: Double = 0.0,
  maximumValue: Double = 1.0,
  step: Double? = nil
) -> Node {
  var attributes: Node.Attributes = [
    .value: .number(value),
    .minimumValue: .number(minimumValue),
    .maximumValue: .number(maximumValue),
  ]

  if let step = step {
    attributes[.step] = .number(step)
  }

  return Node(type: .slider, attributes: attributes)
}
