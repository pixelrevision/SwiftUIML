public func ZStackNode(
  alignment: Node.Alignment = .center,
  @NodeBuilder content: () -> [Node]
) -> Node {
  Node(
    type: .zStack,
    attributes: [.alignment: .string(alignment.rawValue)],
    children: content()
  )
}
