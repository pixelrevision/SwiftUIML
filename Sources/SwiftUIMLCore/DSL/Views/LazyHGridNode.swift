/// Creates a lazy horizontal grid
/// - Parameters:
///   - rows: Number of rows (creates flexible rows)
///   - alignment: Vertical alignment
///   - spacing: Horizontal spacing between columns
///   - content: Grid content
public func LazyHGridNode(
  rows: Int,
  alignment: Node.VerticalAlignment = .center,
  spacing: Double? = nil,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attrs: Node.Attributes = [
    .rows: .number(Double(rows)),
    .alignment: .string(alignment.rawValue),
  ]
  if let spacing = spacing {
    attrs[.spacing] = .number(spacing)
  }
  return Node(
    type: .lazyHGrid,
    attributes: attrs,
    children: content()
  )
}
