public func ListNode(
  @NodeBuilder content: () -> [Node]
) -> Node {
  return Node(
    type: .list,
    attributes: [:],
    children: content()
  )
}
