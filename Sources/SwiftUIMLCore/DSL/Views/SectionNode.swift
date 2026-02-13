/// Creates a Section node
/// - Parameter content: The child nodes
/// - Returns: A Section node
public func SectionNode(@NodeBuilder content: () -> [Node]) -> Node {
  Node(type: .section, children: content())
}

/// Creates a Section node with a header
/// - Parameters:
///   - header: The header node
///   - content: The child nodes
/// - Returns: A Section node with header
public func SectionNode(header: Node, @NodeBuilder content: () -> [Node]) -> Node {
  Node(type: .section, attributes: [.header: .node(header)], children: content())
}

/// Creates a Section node with a footer
/// - Parameters:
///   - footer: The footer node
///   - content: The child nodes
/// - Returns: A Section node with footer
public func SectionNode(footer: Node, @NodeBuilder content: () -> [Node]) -> Node {
  Node(type: .section, attributes: [.footer: .node(footer)], children: content())
}

/// Creates a Section node with both header and footer
/// - Parameters:
///   - header: The header node
///   - footer: The footer node
///   - content: The child nodes
/// - Returns: A Section node with header and footer
public func SectionNode(header: Node, footer: Node, @NodeBuilder content: () -> [Node]) -> Node {
  Node(type: .section, attributes: [.header: .node(header), .footer: .node(footer)], children: content())
}
