/// Creates a secure text field (password input) with placeholder
/// Use .onTextChange(), .onSubmit(), .onFocus(), and .onBlur() modifiers for message handling
public func SecureFieldNode(
  _ placeholder: String,
  value: String? = nil
) -> Node {
  var attributes: Node.Attributes = [
    .placeholder: .string(placeholder),
  ]

  if let value = value {
    attributes[.value] = .string(value)
  }

  return Node(type: .secureField, attributes: attributes)
}
