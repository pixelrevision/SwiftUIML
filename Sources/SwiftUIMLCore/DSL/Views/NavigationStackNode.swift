/// Creates a navigation stack container
/// - Parameter content: The root content
public func NavigationStackNode(@NodeBuilder content: () -> [Node]) -> Node {
  return Node(type: .navigationStack, children: content())
}
