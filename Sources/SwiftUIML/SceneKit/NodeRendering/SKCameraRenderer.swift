import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKCameraRenderer: SKNodeRenderer {
  static let type: ViewType = .skCamera

  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let camera = SCNCamera()

    // Field of view (horizontal by default)
    if let fov = node.attributes[.fieldOfView]?.cgFloat {
      camera.fieldOfView = fov
    }

    // Clipping planes
    if let zNear = node.attributes[.zNear]?.cgFloat {
      camera.zNear = Double(zNear)
    }
    if let zFar = node.attributes[.zFar]?.cgFloat {
      camera.zFar = Double(zFar)
    }

    // Orthographic projection
    if let usesOrtho = node.attributes[.usesOrthographicProjection]?.bool {
      camera.usesOrthographicProjection = usesOrtho

      // Only set orthographic scale if using orthographic projection
      if usesOrtho, let scale = node.attributes[.orthographicScale]?.cgFloat {
        camera.orthographicScale = Double(scale)
      }
    }

    let cameraNode = SCNNode()
    cameraNode.camera = camera

    // Register node for lookups (constraints, debugging, etc.)
    context.register(scnNode: cameraNode, for: node.id)

    // Apply SK modifiers to the node (position, rotation, etc.)
    cameraNode.applySKModifiers(node, context: context, handler: messageHandler)

    return cameraNode
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      SKGroupNode {
        SKCameraNode(
          fieldOfView: 60,
          zNear: 0.2,
          zFar: 1000,
          usesOrthographicProjection: false,
          orthographicScale: 1.2
        )
        .skPosition(x: 0, y: 0, z: 10)
        
        SKCubeNode()
      }
    }
    .allowsCameraControl()
    .addDefaultLight()
    .backgroundColor("#CCCCCC")
  }
}
