//
//  SKGroupNode.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

/// Creates a SceneKit group/container node for organizing hierarchies
public func SKGroupNode(@NodeBuilder content: () -> [Node] = { [] }) -> Node {
  return Node(type: .skGroup, attributes: [:], children: content())
}
