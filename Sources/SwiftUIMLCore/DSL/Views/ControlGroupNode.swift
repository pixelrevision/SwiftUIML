/// Creates a control group (groups related controls with unified appearance)
/// - Parameter content: Controls to display inside the group
/// - Returns: Node configured as a control group
public func ControlGroupNode(
  @NodeBuilder content: () -> [Node]
) -> Node {
  Node(
    type: .controlGroup,
    attributes: [:],
    children: content()
  )
}
