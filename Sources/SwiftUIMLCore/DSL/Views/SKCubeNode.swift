/// Creates a SceneKit cube (box) node
public func SKCubeNode(width: Double = 1.0, height: Double = 1.0, length: Double = 1.0, chamferRadius: Double = 0.0) -> Node {
  return Node(
    type: .skCube,
    attributes: [
      .width: .number(width),
      .height: .number(height),
      .length: .number(length),
      .chamferRadius: .number(chamferRadius),
    ]
  )
}
