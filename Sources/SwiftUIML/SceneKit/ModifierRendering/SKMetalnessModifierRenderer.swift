import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKMetalnessModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skMetalness

  static func apply(
    to scnNode: SCNNode,
    node: borrowing Node,
    value: AttributeValue,
    context: SKContext,
    messageHandler: MessageHandler?
  ) -> Bool {
    guard let geometry = scnNode.geometry else {
      return false
    }

    // Get or create the first material
    let material: SCNMaterial
    if let firstMaterial = geometry.firstMaterial {
      material = firstMaterial
    }
    else {
      material = SCNMaterial()
      geometry.materials = [material]
    }

    // Apply numeric value if present
    if let metalness = value.cgFloat {
      material.metalness.contents = metalness
    }

    // Apply texture if present (will modulate the value)
    if let textureNode = node.attributes[.skMetalnessTexture]?.node {
      SKTextureRenderer.apply(to: material.metalness, node: textureNode)
    }
    else if let textureURL = node.attributes[.skMetalnessTexture]?.string,
              let url = URL(string: textureURL) {
      material.metalness.contents = url
    }

    return true
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      SKOmniLightNode(intensity: 1000)
        .skPosition(x: 2, y: 2, z: 3)

      SKSphereNode(radius: 1.0)
        .skDiffuse("#FFD700")
        .skRoughness(0.1)
        .skMetalness(1.0)
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
