/// Creates a lazy vertical grid
/// - Parameters:
///   - columns: Number of columns (creates flexible columns)
///   - alignment: Horizontal alignment
///   - spacing: Vertical spacing between rows
///   - content: Grid content
public func LazyVGridNode(
  columns: Int,
  alignment: Node.HorizontalAlignment = .center,
  spacing: Double? = nil,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attrs: Node.Attributes = [
    .columns: .number(Double(columns)),
    .alignment: .string(alignment.rawValue),
  ]
  if let spacing = spacing {
    attrs[.spacing] = .number(spacing)
  }
  return Node(
    type: .lazyVGrid,
    attributes: attrs,
    children: content()
  )
}
