import Foundation

/// Core data structure for rendering and passing around.  Similar to XML/DOM without a value.
public struct Node: Codable, Identifiable, Hashable, Sendable {
  public typealias Attributes = OrderedMultiDictionary<AttributeKey, AttributeValue>

  public var type: ViewType
  public var attributes: Attributes
  public var children: [Node]?

  public var id: String {
    attributes[AttributeKey.id]?.string ?? String(hashValue)
  }

  public init(
    type: ViewType,
    attributes: Attributes = .init(),
    children: [Node]? = nil
  ) {
    self.type = type
    self.attributes = attributes
    self.children = children
  }

  public func addingAttribute(_ key: AttributeKey, value: AttributeValue) -> Node {
    var updated = attributes
    updated.append(key, value)
    return Node(
      type: type,
      attributes: updated,
      children: children
    )
  }
}
