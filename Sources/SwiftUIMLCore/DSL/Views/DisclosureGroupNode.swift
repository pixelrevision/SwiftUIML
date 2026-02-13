/// Creates a disclosure group (collapsible/expandable section)
/// Use .onExpandedChange() modifier for event handling
public func DisclosureGroupNode(
  _ label: String,
  isExpanded: Bool? = nil,
  @NodeBuilder content: () -> [Node]
) -> Node {
  var attributes: Node.Attributes = [
    .label: .string(label),
  ]

  if let isExpanded = isExpanded {
    attributes[.isExpanded] = .bool(isExpanded)
  }

  return Node(
    type: .disclosureGroup,
    attributes: attributes,
    children: content()
  )
}
