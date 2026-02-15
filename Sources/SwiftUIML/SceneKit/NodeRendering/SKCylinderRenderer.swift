import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKCylinderRenderer: SKNodeRenderer {
  static let type: ViewType = .skCylinder

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let radius = node.attributes[.radius]?.cgFloat ?? 0.5
    let height = node.attributes[.height]?.cgFloat ?? 1.0

    let cylinder = SCNCylinder(radius: radius, height: height)
    let scnNode = SCNNode(geometry: cylinder)

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
      SKCylinderNode()
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
