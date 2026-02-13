/// Creates a Group node
/// - Parameter content: The child nodes
/// - Returns: A Group node
public func GroupNode(@NodeBuilder content: () -> [Node]) -> Node {
  Node(type: .group, children: content())
}
