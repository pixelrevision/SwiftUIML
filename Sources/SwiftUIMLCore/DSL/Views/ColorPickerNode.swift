/// Creates a ColorPicker node with a string label
/// - Parameters:
///   - label: The label text for the color picker
///   - value: Optional initial color value (hex string with or without alpha, e.g., "#FF0000" or "#FF0000FF")
/// - Returns: A node representing a color picker
public func ColorPickerNode(
  _ label: String,
  value: String? = nil
) -> Node {
  var attributes: Node.Attributes = [
    .label: .string(label),
  ]

  if let value = value {
    attributes[.value] = .string(value)
  }

  return Node(
    type: .colorPicker,
    attributes: attributes
  )
}
