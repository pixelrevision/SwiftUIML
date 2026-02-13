/// Creates a button
public func ButtonNode(_ title: String, onTap: AttributeValue) -> Node {
  Node(
    type: .button,
    attributes: [
      .title: .string(title),
      .onTap: onTap,
    ]
  )
}

/// Creates a button
public func ButtonNode(_ title: String, onTap: String) -> Node {
  ButtonNode(title, onTap: .string(onTap))
}

/// Creates a button with content builder
public func ButtonNode(onTap: AttributeValue, @NodeBuilder content: () -> [Node]) -> Node {
  Node(
    type: .button,
    attributes: [.onTap: onTap],
    children: content()
  )
}

/// Creates a button with content builder (string action)
public func ButtonNode(action: String, @NodeBuilder content: () -> [Node]) -> Node {
  ButtonNode(onTap: .string(action), content: content)
}

/// Creates a button
public func ButtonNode(_ title: String, onTap: [AttributeKey: AttributeValue]) -> Node {
  ButtonNode(title, onTap: .dict(onTap))
}
