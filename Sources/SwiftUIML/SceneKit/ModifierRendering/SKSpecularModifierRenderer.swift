import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKSpecularModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skSpecular

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
      material.specular.contents = HexColor.colorFromHex(colorHex)
    }

    // Apply texture if present (will modulate the color)
    if let textureNode = node.attributes[.skSpecularTexture]?.node {
      SKTextureRenderer.apply(to: material.specular, node: textureNode)
    }
    else if let textureURL = node.attributes[.skSpecularTexture]?.string,
              let url = URL(string: textureURL) {
      material.specular.contents = url
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
        .skDiffuse("#3366FF")
        .skSpecular("#FFFFFF")
        .skShininess(1.0)
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
