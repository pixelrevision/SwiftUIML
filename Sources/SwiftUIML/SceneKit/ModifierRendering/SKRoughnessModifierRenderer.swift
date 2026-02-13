import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKRoughnessModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skRoughness

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
    if let roughness = value.cgFloat {
      material.roughness.contents = roughness
    }

    // Apply texture if present (will modulate the value)
    if let textureNode = node.attributes[.skRoughnessTexture]?.node {
      SKTextureRenderer.apply(to: material.roughness, node: textureNode)
    }
    else if let textureURL = node.attributes[.skRoughnessTexture]?.string,
              let url = URL(string: textureURL) {
      material.roughness.contents = url
    }

    return true
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      SKCameraNode()
        .skPosition(x: 0, y: 0, z: 5)

      SKOmniLightNode(intensity: 1000)
        .skPosition(x: 2, y: 2, z: 3)

      SKSphereNode(radius: 1.0)
        .skDiffuse("#8844FF")
        .skRoughness(0.2)
        .skMetalness(0.8)
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
