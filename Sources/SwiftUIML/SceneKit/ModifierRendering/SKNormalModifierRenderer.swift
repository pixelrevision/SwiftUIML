import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKNormalModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skNormalTexture

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

    // Handle texture node
    if let textureNode = value.node {
      SKTextureRenderer.apply(to: material.normal, node: textureNode)
      return true
    }

    // Convenience: Handle simple URL string
    if let urlString = value.string, let url = URL(string: urlString) {
      material.normal.contents = url
      return true
    }

    return false
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      SKCameraNode()
        .skPosition(x: 0, y: 0, z: 5)

      SKOmniLightNode(intensity: 1000)
        .skPosition(x: 2, y: 2, z: 3)

      SKCubeNode(width: 2.0, height: 2.0, length: 2.0)
        .skDiffuse("#888888")
        .skNormal(
          texture: SKTextureNode(url: "https://dl.polyhaven.org/file/ph-assets/Textures/jpg/2k/brick_wall_001/brick_wall_001_nor_gl_2k.jpg")
            .intensity(1.0)
        )
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
