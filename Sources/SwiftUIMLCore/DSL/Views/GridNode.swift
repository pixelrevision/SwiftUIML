public func GridNode(
  alignment: Node.Alignment = .center,
  horizontalSpacing: Double? = nil,
  verticalSpacing: Double? = nil,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attrs: Node.Attributes = [.alignment: .string(alignment.rawValue)]
  if let horizontalSpacing = horizontalSpacing {
    attrs[.horizontalSpacing] = .number(horizontalSpacing)
  }
  if let verticalSpacing = verticalSpacing {
    attrs[.verticalSpacing] = .number(verticalSpacing)
  }
  return Node(
    type: .grid,
    attributes: attrs,
    children: content()
  )
}
