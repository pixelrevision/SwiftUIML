import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKTorusRenderer: SKNodeRenderer {
  static let type: ViewType = .skTorus

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let ringRadius = node.attributes[.ringRadius]?.cgFloat ?? 0.5
    let pipeRadius = node.attributes[.pipeRadius]?.cgFloat ?? 0.25

    let torus = SCNTorus(ringRadius: ringRadius, pipeRadius: pipeRadius)
    let scnNode = SCNNode(geometry: torus)

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
      SKTorusNode()
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
