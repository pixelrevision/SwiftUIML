//
//  SKConeNode.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

/// Creates a SceneKit cone node
public func SKConeNode(topRadius: Double = 0.0, bottomRadius: Double = 0.5, height: Double = 1.0) -> Node {
  return Node(
    type: .skCone,
    attributes: [
      .topRadius: .number(topRadius),
      .bottomRadius: .number(bottomRadius),
      .height: .number(height),
    ]
  )
}
