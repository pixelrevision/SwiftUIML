import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKSphereRenderer: SKNodeRenderer {
  static let type: ViewType = .skSphere

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let radius = node.attributes[.radius]?.cgFloat ?? 0.5

    let sphere = SCNSphere(radius: radius)
    let scnNode = SCNNode(geometry: sphere)

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
      SKSphereNode()
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
