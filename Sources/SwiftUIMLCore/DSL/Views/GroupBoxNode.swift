/// Creates a group box (labeled container with styled background)
/// - Parameter label: Optional text label for the group
/// - Parameter content: Views to display inside the group box
/// - Returns: Node configured as a group box
public func GroupBoxNode(
  _ label: String? = nil,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attributes: Node.Attributes = [:]

  if let label = label {
    attributes[.label] = .string(label)
  }

  return Node(
    type: .groupBox,
    attributes: attributes,
    children: content()
  )
}

/// Creates a group box with a custom label node
/// - Parameter label: Custom node to use as the label
/// - Parameter content: Views to display inside the group box
/// - Returns: Node configured as a group box
public func GroupBoxNode(
  label: Node,
  @NodeBuilder content: () -> [Node]
) -> Node {
  Node(
    type: .groupBox,
    attributes: [.label: .node(label)],
    children: content()
  )
}
