/// Creates a container-relative shape node that takes the shape of its nearest container
/// - Returns: A node representing a ContainerRelativeShape
public func ContainerRelativeShapeNode() -> Node {
  Node(type: .containerRelativeShape)
}
