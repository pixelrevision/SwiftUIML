public func LazyHStackNode(
  spacing: Double? = nil,
  alignment: Node.VerticalAlignment = .center,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attrs: Node.Attributes = [.alignment: .string(alignment.rawValue)]
  if let spacing = spacing {
    attrs[.spacing] = .number(spacing)
  }
  return Node(
    type: .lazyHStack,
    attributes: attrs,
    children: content()
  )
}
