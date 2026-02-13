/// Creates a view that conditionally renders children based on color scheme
/// - Parameter content: Builder providing [0] = light mode, [1] = dark mode
/// - Returns: A node that displays different content for light/dark modes
public func ColorSchemeNode(@NodeBuilder content: () -> [Node]) -> Node {
  Node(
    type: .colorScheme,
    children: content()
  )
}
