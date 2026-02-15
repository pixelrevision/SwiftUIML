import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKCubeRenderer: SKNodeRenderer {
  static let type: ViewType = .skCube

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let width = node.attributes[.width]?.cgFloat ?? 1.0
    let height = node.attributes[.height]?.cgFloat ?? 1.0
    let length = node.attributes[.length]?.cgFloat ?? 1.0
    let chamferRadius = node.attributes[.chamferRadius]?.cgFloat ?? 0.0
    
    let box = SCNBox(
      width: width,
      height: height,
      length: length,
      chamferRadius: chamferRadius
    )
    let scnNode = SCNNode(geometry: box)
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
      SKCubeNode()
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
