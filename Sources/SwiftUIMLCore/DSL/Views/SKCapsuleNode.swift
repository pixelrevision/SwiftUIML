/// Creates a SceneKit capsule node
public func SKCapsuleNode(capRadius: Double = 0.5, height: Double = 2.0) -> Node {
  return Node(
    type: .skCapsule,
    attributes: [
      .capRadius: .number(capRadius),
      .height: .number(height),
    ]
  )
}
