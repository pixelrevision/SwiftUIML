public func LazyVStackNode(
  spacing: Double? = nil,
  alignment: Node.HorizontalAlignment = .center,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attrs: Node.Attributes = [.alignment: .string(alignment.rawValue)]
  if let spacing = spacing {
    attrs[.spacing] = .number(spacing)
  }
  return Node(
    type: .lazyVStack,
    attributes: attrs,
    children: content()
  )
}
