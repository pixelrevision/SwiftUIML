/// Creates a multi-line text editor
/// Use .onTextChange(), .onFocus(), and .onBlur() modifiers for message handling
public func TextEditorNode(
  value: String? = nil
) -> Node {
  var attributes: Node.Attributes = [:]

  if let value = value {
    attributes[.value] = .string(value)
  }

  return Node(type: .textEditor, attributes: attributes)
}
