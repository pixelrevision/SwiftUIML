import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKPyramidRenderer: SKNodeRenderer {
  static let type: ViewType = .skPyramid

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let width = node.attributes[.width]?.cgFloat ?? 1.0
    let height = node.attributes[.height]?.cgFloat ?? 1.0
    let length = node.attributes[.length]?.cgFloat ?? 1.0

    let pyramid = SCNPyramid(width: width, height: height, length: length)
    let scnNode = SCNNode(geometry: pyramid)

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
      SKPyramidNode()
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
