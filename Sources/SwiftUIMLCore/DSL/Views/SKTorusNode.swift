/// Creates a SceneKit torus node
public func SKTorusNode(ringRadius: Double = 0.5, pipeRadius: Double = 0.25) -> Node {
  return Node(
    type: .skTorus,
    attributes: [
      .ringRadius: .number(ringRadius),
      .pipeRadius: .number(pipeRadius),
    ]
  )
}
