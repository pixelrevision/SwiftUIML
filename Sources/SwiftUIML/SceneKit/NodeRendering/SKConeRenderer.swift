import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKConeRenderer: SKNodeRenderer {
  static let type: ViewType = .skCone

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let topRadius = node.attributes[.topRadius]?.cgFloat ?? 0.0
    let bottomRadius = node.attributes[.bottomRadius]?.cgFloat ?? 0.5
    let height = node.attributes[.height]?.cgFloat ?? 1.0

    let cone = SCNCone(topRadius: topRadius, bottomRadius: bottomRadius, height: height)
    let scnNode = SCNNode(geometry: cone)

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
      SKConeNode()
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
