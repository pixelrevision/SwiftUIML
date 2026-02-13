import Foundation

/// Creates a share link node with just a URL
public func ShareLinkNode(url: String) -> Node {
  Node(
    type: .shareLink,
    attributes: [
      .url: AttributeValue(url),
    ]
  )
}

/// Creates a share link node with a title and URL
public func ShareLinkNode(_ title: String, url: String) -> Node {
  Node(
    type: .shareLink,
    attributes: [
      .title: AttributeValue(title),
      .url: AttributeValue(url),
    ]
  )
}
