/// Creates a SceneKit pyramid node
public func SKPyramidNode(width: Double = 1.0, height: Double = 1.0, length: Double = 1.0) -> Node {
  return Node(
    type: .skPyramid,
    attributes: [
      .width: .number(width),
      .height: .number(height),
      .length: .number(length),
    ]
  )
}
