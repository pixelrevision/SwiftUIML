/// Creates a navigation link that pushes a value to the navigation path
/// - Parameters:
///   - value: The value to push when tapped (must match a navigationDestination)
///   - label: The label content builder
public func NavigationLinkNode(
  value: String,
  @NodeBuilder label: () -> [Node]
) -> Node {
  return Node(
    type: .navigationLink,
    attributes: [.value: .string(value)],
    children: label()
  )
}

/// Creates a navigation link with a single label node
/// - Parameters:
///   - value: The value to push when tapped
///   - label: The label node
public func NavigationLinkNode(
  value: String,
  label: Node
) -> Node {
  return Node(
    type: .navigationLink,
    attributes: [.value: .string(value)],
    children: [label]
  )
}

/// Creates a navigation link with a text label
/// - Parameters:
///   - text: The text for the link label
///   - value: The value to push when tapped
public func NavigationLinkNode(
  _ text: String,
  value: String
) -> Node {
  return Node(
    type: .navigationLink,
    attributes: [.value: .string(value)],
    children: [TextNode(text)]
  )
}
