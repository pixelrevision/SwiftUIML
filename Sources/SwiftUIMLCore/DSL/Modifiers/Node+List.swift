import Foundation

public extension Node {
  // MARK: - List Row Background

  /// Sets the background view for a list row
  /// - Parameter background: The node to use as background
  func listRowBackground(@NodeBuilder background: () -> [Node]) -> Node {
    let backgroundNodes = background()
    let backgroundNode: Node
    if backgroundNodes.count == 1 {
      backgroundNode = backgroundNodes[0]
    }
    else {
      backgroundNode = Node(type: .vStack, children: backgroundNodes)
    }
    return addingAttribute(.listRowBackground, value: .node(backgroundNode))
      .ignoreEquatable()
  }

  /// Sets the background view for a list row
  /// - Parameter background: The node to use as background
  func listRowBackground(_ background: Node) -> Node {
    addingAttribute(.listRowBackground, value: .node(background))
      .ignoreEquatable()
  }

  // MARK: - List Row Insets

  /// Sets custom edge insets for a list row
  /// - Parameters:
  ///   - top: Top inset
  ///   - leading: Leading inset
  ///   - bottom: Bottom inset
  ///   - trailing: Trailing inset
  func listRowInsets(top: Double = 0, leading: Double = 0, bottom: Double = 0, trailing: Double = 0) -> Node {
    addingAttribute(.listRowInsets, value: [
      .top: .number(top),
      .leading: .number(leading),
      .bottom: .number(bottom),
      .trailing: .number(trailing),
    ])
    .ignoreEquatable()
  }

  // MARK: - List Row Separator

  /// Sets the visibility of the list row separator
  /// - Parameter visibility: The visibility ("automatic", "visible", or "hidden")
  func listRowSeparator(visibility: Visibility) -> Node {
    addingAttribute(.listRowSeparator, value: .string(visibility.rawValue))
      .ignoreEquatable()
  }

  /// Sets the visibility of the list row separator
  /// - Parameters:
  ///   - visibility: The visibility ("automatic", "visible", or "hidden")
  ///   - edges: The edges to apply the visibility to (top, bottom, or all)
  func listRowSeparator(visibility: Visibility, edges: VerticalEdges) -> Node {
    addingAttribute(.listRowSeparator, value: [
      .visibility: .string(visibility.rawValue),
      .edges: .string(edges.rawValue),
    ])
    .ignoreEquatable()
  }
}
