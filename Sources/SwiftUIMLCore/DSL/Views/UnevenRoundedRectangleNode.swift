/// Creates an uneven rounded rectangular shape node with different corner radii
/// - Parameters:
///   - topLeading: The radius for the top-leading corner (default: 0)
///   - bottomLeading: The radius for the bottom-leading corner (default: 0)
///   - bottomTrailing: The radius for the bottom-trailing corner (default: 0)
///   - topTrailing: The radius for the top-trailing corner (default: 0)
/// - Returns: A node representing an UnevenRoundedRectangle
public func UnevenRoundedRectangleNode(
  topLeading: Double = 0,
  bottomLeading: Double = 0,
  bottomTrailing: Double = 0,
  topTrailing: Double = 0
) -> Node {
  Node(
    type: .unevenRoundedRectangle,
    attributes: [
      .topLeading: .number(topLeading),
      .bottomLeading: .number(bottomLeading),
      .bottomTrailing: .number(bottomTrailing),
      .topTrailing: .number(topTrailing),
    ]
  )
}
