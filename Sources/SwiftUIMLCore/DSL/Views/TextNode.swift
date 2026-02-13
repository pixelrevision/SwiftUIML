public func TextNode(_ text: String) -> Node {
  Node(type: .text, attributes: [.text: .string(text)])
}

public func TextNode(markdown: String) -> Node {
  Node(type: .text, attributes: [.markdown: .string(markdown)])
}
