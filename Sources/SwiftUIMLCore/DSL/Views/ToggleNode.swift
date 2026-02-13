/// Creates a toggle with label
/// Use .onToggle() modifier for message handling
public func ToggleNode(
  _ label: String,
  isOn: Bool = false
) -> Node {
  Node(type: .toggle, attributes: [
    .label: .string(label),
    .isOn: .bool(isOn),
  ])
}
