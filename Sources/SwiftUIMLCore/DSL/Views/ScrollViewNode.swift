public func ScrollViewNode(
  axis: Node.Axis = .vertical,
  @NodeBuilder content: () -> [Node]
) -> Node {
  Node(
    type: .scrollView,
    attributes: [.axis: .string(axis.rawValue)],
    children: content()
  )
}
