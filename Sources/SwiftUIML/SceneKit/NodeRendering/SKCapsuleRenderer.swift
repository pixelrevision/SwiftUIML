//
//  SKCapsuleRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKCapsuleRenderer: SKNodeRenderer {
  static let type: ViewType = .skCapsule

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let capRadius = node.attributes[.capRadius]?.cgFloat ?? 0.5
    let height = node.attributes[.height]?.cgFloat ?? 2.0

    let capsule = SCNCapsule(capRadius: capRadius, height: height)
    let scnNode = SCNNode(geometry: capsule)

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
      SKCapsuleNode()
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
