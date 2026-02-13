/// Creates a picker
/// Children should use .tag() modifier to identify selections
/// Use .onPickerChange() modifier for message handling
public func PickerNode(
  _ label: String,
  selection: String? = nil,
  @NodeBuilder content: () -> [Node]
) -> Node {
  let attributes: Node.Attributes = [
    .label: .string(label),
  ]

  var node = Node(type: .picker, attributes: attributes, children: content())

  if let selection = selection {
    node = node.addingAttribute(.selection, value: .string(selection))
  }

  return node
}
