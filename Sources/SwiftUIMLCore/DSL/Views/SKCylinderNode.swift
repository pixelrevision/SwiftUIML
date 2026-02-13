/// Creates a SceneKit cylinder node
public func SKCylinderNode(radius: Double = 0.5, height: Double = 1.0) -> Node {
  return Node(
    type: .skCylinder,
    attributes: [
      .radius: .number(radius),
      .height: .number(height),
    ]
  )
}
