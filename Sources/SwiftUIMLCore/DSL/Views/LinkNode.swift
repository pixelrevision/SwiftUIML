import Foundation

/// Creates a link node with a text label
public func LinkNode(_ title: String, url: String) -> Node {
  Node(
    type: .link,
    attributes: [
      .title: AttributeValue(title),
      .url: AttributeValue(url),
    ]
  )
}

/// Creates a link node with custom content
public func LinkNode(url: String, @NodeBuilder content: () -> [Node]) -> Node {
  Node(
    type: .link,
    attributes: [
      .url: AttributeValue(url),
    ],
    children: content()
  )
}
