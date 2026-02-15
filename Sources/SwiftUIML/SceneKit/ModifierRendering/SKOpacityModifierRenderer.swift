import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKOpacityModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .opacity

  static func apply(
    to scnNode: SCNNode,
    node: borrowing Node,
    value: AttributeValue,
    context: SKContext,
    messageHandler: MessageHandler?
  ) -> Bool {
    guard let opacity = value.cgFloat else {
      return false
    }
    scnNode.opacity = opacity
    return true
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      SKOmniLightNode(intensity: 1000)
        .skPosition(x: 2, y: 2, z: 3)
      
      SKSphereNode(radius: 1.0)
        .skPosition(z: -3)
        .skDiffuse("#FF0000")
        .skRoughness(0.1)
      
      SKSphereNode(radius: 1.0)
        .skDiffuse("#FFD700")
        .skRoughness(0.1)
        .opacity(0.3)
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
