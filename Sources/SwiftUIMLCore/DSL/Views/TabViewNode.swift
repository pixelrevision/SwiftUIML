public func TabViewNode(
  style: Node.TabViewStyle? = nil,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attrs: Node.Attributes = [:]
  if let style = style {
    attrs[.tabViewStyle] = .string(style.rawValue)
  }
  return Node(
    type: .tabView,
    attributes: attrs,
    children: content()
  )
}
