/// Creates a form container
/// Forms automatically display labels for pickers and provide platform-appropriate styling
public func FormNode(
  @NodeBuilder content: () -> [Node]
) -> Node {
  return Node(
    type: .form,
    attributes: [:],
    children: content()
  )
}
