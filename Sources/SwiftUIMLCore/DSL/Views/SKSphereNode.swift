//
//  SKSphereNode.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

/// Creates a SceneKit sphere node
public func SKSphereNode(radius: Double = 0.5) -> Node {
  return Node(
    type: .skSphere,
    attributes: [
      .radius: .number(radius),
    ]
  )
}
