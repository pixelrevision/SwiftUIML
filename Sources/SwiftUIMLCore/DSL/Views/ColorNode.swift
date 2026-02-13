public func ColorNode(_ value: String) -> Node {
  Node(type: .color, attributes: [.value: .string(value)])
}
