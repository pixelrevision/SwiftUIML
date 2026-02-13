import Foundation

/// Creates an empty view node that renders nothing
public func EmptyViewNode() -> Node {
  Node(type: .emptyView)
}
