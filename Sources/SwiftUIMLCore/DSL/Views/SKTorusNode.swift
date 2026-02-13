//
//  SKTorusNode.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

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
