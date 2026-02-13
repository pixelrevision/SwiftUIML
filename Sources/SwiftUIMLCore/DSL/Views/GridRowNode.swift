public func GridRowNode(
  alignment: Node.VerticalAlignment = .center,
  @NodeBuilder content: () -> [Node]
) -> Node {
  return Node(
    type: .gridRow,
    attributes: [.alignment: .string(alignment.rawValue)],
    children: content()
  )
}
