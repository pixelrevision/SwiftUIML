/// Creates a stepper
/// Use .onStepperChange() modifier for message handling
public func StepperNode(
  _ label: String,
  value: Double = 0,
  minimumValue: Double = 0,
  maximumValue: Double = 100,
  step: Double = 1
) -> Node {
  let attributes: Node.Attributes = [
    .label: .string(label),
    .value: .number(value),
    .minimumValue: .number(minimumValue),
    .maximumValue: .number(maximumValue),
    .step: .number(step),
  ]

  return Node(type: .stepper, attributes: attributes)
}
