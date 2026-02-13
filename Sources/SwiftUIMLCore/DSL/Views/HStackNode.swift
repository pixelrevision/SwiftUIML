public func HStackNode(
  spacing: Double? = nil,
  alignment: Node.VerticalAlignment = .center,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attrs: Node.Attributes = [.alignment: .string(alignment.rawValue)]
  if let spacing = spacing {
    attrs[.spacing] = .number(spacing)
  }
  return Node(
    type: .hStack,
    attributes: attrs,
    children: content()
  )
}
