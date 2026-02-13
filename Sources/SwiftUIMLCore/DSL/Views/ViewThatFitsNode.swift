public func ViewThatFitsNode(
  axis: Node.Axis = .horizontal,
  @NodeBuilder content: () -> [Node]
) -> Node {
  return Node(
    type: .viewThatFits,
    attributes: [.axis: .string(axis.rawValue)],
    children: content()
  )
}
