/// Creates an async image node that loads from a URL
public func AsyncImageNode(url: String) -> Node {
  Node(type: .asyncImage, attributes: [.url: .string(url)])
}

/// Creates an async image node with custom phase views
/// - Parameters:
///   - url: The URL to load the image from
///   - content: Builder that provides phase-specific child nodes
public func AsyncImageNode(url: String, @NodeBuilder content: () -> [Node]) -> Node {
  Node(
    type: .asyncImage,
    attributes: [.url: .string(url)],
    children: content()
  )
}

/// Defines content to show while the image is loading
public func AsyncImageEmptyNode(@NodeBuilder content: () -> [Node]) -> Node {
  let children = content()
  return Node(
    type: .asyncImageEmpty,
    children: children.count == 1 ? children : [Node(type: .vStack, children: children)]
  )
}

/// Defines modifiers to apply to the successfully loaded image
/// Note: Any modifiers applied to this node will be applied to the loaded image
public func AsyncImageSuccessNode() -> Node {
  Node(type: .asyncImageSuccess)
}

/// Defines content to show if the image fails to load
public func AsyncImageFailureNode(@NodeBuilder content: () -> [Node]) -> Node {
  let children = content()
  return Node(
    type: .asyncImageFailure,
    children: children.count == 1 ? children : [Node(type: .vStack, children: children)]
  )
}
