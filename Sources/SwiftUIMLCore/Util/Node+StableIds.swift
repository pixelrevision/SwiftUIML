import Foundation

public extension Node {
  /// Recursively applies stable IDs to nodes that don't have an explicit ID attribute.
  /// IDs are generated as path-based identifiers (e.g., "VStack0.Text0", "VStack0.HStack0.Text1", etc.)
  func addingStableIds() -> Node {
    addingStableIds(path: "", counters: [:]).node
  }

  private func addingStableIds(path: String, counters: [String: Int]) -> (node: Node, counters: [String: Int]) {
    var updatedCounters = counters
    var updatedAttributes = attributes

    // If this node doesn't have an explicit ID, generate one based on path
    if attributes[.id] == nil {
      let typeKey = type.rawValue
      let index = updatedCounters[typeKey, default: 0]
      updatedCounters[typeKey] = index + 1

      // Build path-based ID (e.g., "VStack0.HStack0.Text1")
      let nodeId = path.isEmpty ? "\(typeKey)\(index)" : "\(path).\(typeKey)\(index)"
      updatedAttributes[.id] = .string(nodeId)
    }

    // Get the current node's ID for building child paths
    let currentId = updatedAttributes[.id]?.string ?? ""

    // Recursively process children with updated path
    var updatedChildren: [Node]?
    if let children = children {
      var processedChildren: [Node] = []
      var childCounters: [String: Int] = [:]

      // Use local counters shared across siblings
      for child in children {
        let result = child.addingStableIds(path: currentId, counters: childCounters)
        processedChildren.append(result.node)
        childCounters = result.counters
      }

      updatedChildren = processedChildren
    }

    let updatedNode = Node(
      type: type,
      attributes: updatedAttributes,
      children: updatedChildren
    )

    return (updatedNode, updatedCounters)
  }
}
