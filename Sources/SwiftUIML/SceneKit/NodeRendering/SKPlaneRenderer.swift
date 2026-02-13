//
//  SKPlaneRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKPlaneRenderer: SKNodeRenderer {
  static let type: ViewType = .skPlane

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let width = node.attributes[.width]?.cgFloat ?? 1.0
    let height = node.attributes[.height]?.cgFloat ?? 1.0

    let plane = SCNPlane(width: width, height: height)
    let scnNode = SCNNode(geometry: plane)

    // Register node for lookups (constraints, debugging, etc.)
    context.register(scnNode: scnNode, for: node.id)

    // Apply SK modifiers to the node
    scnNode.applySKModifiers(node, context: context, handler: messageHandler)

    return scnNode
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      SKPlaneNode()
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
