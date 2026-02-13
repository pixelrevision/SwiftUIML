/// Creates a menu with a text label and menu items
public func MenuNode(_ label: String, @NodeBuilder content: () -> [Node]) -> Node {
  Node(
    type: .menu,
    attributes: [.label: .string(label)],
    children: content()
  )
}

/// Creates a menu with a custom node as the label and menu items
public func MenuNode(label: Node, @NodeBuilder content: () -> [Node]) -> Node {
  Node(
    type: .menu,
    attributes: [.label: .node(label)],
    children: content()
  )
}
