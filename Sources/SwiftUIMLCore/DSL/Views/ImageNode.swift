/// Creates an image node from a named image asset
/// - Parameters:
///   - name: The name of the image in the asset catalog
///   - bundle: Optional bundle identifier (e.g., "com.example.MyAppTests")
public func ImageNode(name: String, bundle: String? = nil) -> Node {
  var attributes: Node.Attributes = [.name: .string(name)]
  if let bundle = bundle {
    attributes[.bundle] = .string(bundle)
  }
  return Node(type: .image, attributes: attributes)
}

/// Creates an image node from an SF Symbol
public func ImageNode(systemName: String) -> Node {
  Node(type: .image, attributes: [.systemName: .string(systemName)])
}
