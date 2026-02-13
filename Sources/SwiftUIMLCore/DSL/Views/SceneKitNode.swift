//
//  SceneKitNode.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 10/31/25.
//

/// Creates a SceneKit view node
public func SceneKitNode(@NodeBuilder content: () -> [Node] = { [] }) -> Node {
  return Node(type: .sceneKit, attributes: [:], children: content())
}
