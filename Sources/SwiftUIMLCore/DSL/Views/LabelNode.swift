import Foundation

/// Creates a label node with a title and system image icon
public func LabelNode(_ title: String, systemImage: String) -> Node {
  Node(
    type: .label,
    attributes: [
      .title: AttributeValue(title),
      .systemName: AttributeValue(systemImage),
    ]
  )
}
