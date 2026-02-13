/// Creates a text field with placeholder
/// Use .onTextChange(), .onSubmit(), .onFocus(), and .onBlur() modifiers for message handling
public func TextFieldNode(
  _ placeholder: String,
  value: String? = nil
) -> Node {
  var attributes: Node.Attributes = [
    .placeholder: .string(placeholder),
  ]

  if let value = value {
    attributes[.value] = .string(value)
  }

  return Node(type: .textField, attributes: attributes)
}
