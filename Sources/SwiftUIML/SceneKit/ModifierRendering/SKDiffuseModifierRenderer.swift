import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKDiffuseModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skDiffuse

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

    // Apply color value if present
    if let colorHex = value.string {
      material.diffuse.contents = HexColor.colorFromHex(colorHex)
    }

    // Apply texture if present (will modulate the color)
    if let textureNode = node.attributes[.skDiffuseTexture]?.node {
      SKTextureRenderer.apply(to: material.diffuse, node: textureNode)
    }
    else if let textureURL = node.attributes[.skDiffuseTexture]?.string,
              let url = URL(string: textureURL) {
      material.diffuse.contents = url
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
        .skDiffuse("#FF3366")
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
