//
//  SKCameraNode.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

/// Creates a SceneKit camera node
public func SKCameraNode(
  fieldOfView: Double = 60.0,
  zNear: Double = 0.1,
  zFar: Double = 1000.0,
  usesOrthographicProjection: Bool = false,
  orthographicScale: Double = 1.0
) -> Node {
  return Node(
    type: .skCamera,
    attributes: [
      .fieldOfView: .number(fieldOfView),
      .zNear: .number(zNear),
      .zFar: .number(zFar),
      .usesOrthographicProjection: .bool(usesOrthographicProjection),
      .orthographicScale: .number(orthographicScale),
    ]
  )
}
