//
//  SKGroupRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKGroupRenderer: SKNodeRenderer {
  static let type: ViewType = .skGroup

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let groupNode = SCNNode()

    // Register node for lookups (constraints, debugging, etc.)
    context.register(scnNode: groupNode, for: node.id)

    // Apply modifiers to the group itself
    groupNode.applySKModifiers(node, context: context, handler: messageHandler)

    // Render and add children
    for child in node.children ?? [] {
      if let childSCNNode = context.renderNode(child, messageHandler: messageHandler) {
        groupNode.addChildNode(childSCNNode)
      }
    }
    return groupNode
  }
}

#Preview("All Geometry Types") {
  DebugView {
    SceneKitNode {
      SKGroupNode {
        // Top row
        SKCubeNode()
          .skPosition(x: -3, y: 1.5, z: 0)
        SKSphereNode()
          .skPosition(x: -1, y: 1.5, z: 0)
        SKCylinderNode()
          .skPosition(x: 1, y: 1.5, z: 0)
        SKConeNode()
          .skPosition(x: 3, y: 1.5, z: 0)

        // Bottom row
        SKPlaneNode()
          .skPosition(x: -3, y: -1.5, z: 0)
        SKTorusNode()
          .skPosition(x: -1, y: -1.5, z: 0)
        SKCapsuleNode()
          .skPosition(x: 1, y: -1.5, z: 0)
        SKPyramidNode()
          .skPosition(x: 3, y: -1.5, z: 0)
      }
    }
    .addDefaultCamera()
    .addDefaultLight()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
