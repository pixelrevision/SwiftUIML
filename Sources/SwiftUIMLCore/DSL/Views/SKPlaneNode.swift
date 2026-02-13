//
//  SKPlaneNode.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

/// Creates a SceneKit plane node
public func SKPlaneNode(width: Double = 1.0, height: Double = 1.0) -> Node {
  return Node(
    type: .skPlane,
    attributes: [
      .width: .number(width),
      .height: .number(height),
    ]
  )
}
