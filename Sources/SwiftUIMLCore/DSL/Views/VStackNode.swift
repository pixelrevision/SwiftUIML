public func VStackNode(
  spacing: Double? = nil,
  alignment: Node.HorizontalAlignment = .center,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attrs: Node.Attributes = [.alignment: .string(alignment.rawValue)]
  if let spacing = spacing {
    attrs[.spacing] = .number(spacing)
  }
  return Node(
    type: .vStack,
    attributes: attrs,
    children: content()
  )
}
