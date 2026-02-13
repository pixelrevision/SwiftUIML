/// Creates a rounded rectangular shape node
/// - Parameter cornerRadius: The corner radius (default: 8)
/// - Returns: A node representing a RoundedRectangle
public func RoundedRectangleNode(cornerRadius: Double = 8) -> Node {
  Node(
    type: .roundedRectangle,
    attributes: [
      .cornerRadius: .number(cornerRadius)
    ]
  )
}
