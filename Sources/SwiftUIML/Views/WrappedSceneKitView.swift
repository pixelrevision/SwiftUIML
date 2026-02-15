import SwiftUI
import SwiftUIMLCore
import SceneKit

struct WrappedSceneKitView: View {
  let node: Node
  let messageHandler: MessageHandler?

  var body: some View {
    SceneKitViewRepresentable(node: node, messageHandler: messageHandler)
  }
}

struct SceneKitViewRepresentable: UIViewRepresentable {
  let node: Node
  let messageHandler: MessageHandler?

  @Environment(\.skRenderContext) var skRenderContext

  func makeUIView(context: Context) -> SCNView {
    let sceneView = SCNView(frame: .zero)
    setup(sceneView: sceneView, context: context)
    return sceneView
  }

  func updateUIView(_ sceneView: SCNView, context: Context) {
    // Update scene properties if needed
    updateSceneProperties(sceneView: sceneView)
  }

  private func setup(sceneView: SCNView, context: Context) {
    // Create and configure scene
    let scene = SCNScene()
    sceneView.scene = scene

    // Create SKContext with scene state
    let skContext = SKContext(renderContext: skRenderContext, scene: scene)

    // Apply view-level properties (NOT recursive, only on SceneKitNode)
    applyViewProperties(to: sceneView)

    // Add default camera if needed
    if node.attributes[.addDefaultCamera]?.bool == true {
      let cameraNode = SCNNode()
      cameraNode.camera = SCNCamera()
      cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
      scene.rootNode.addChildNode(cameraNode)
    }

    // Add default light if not using auto-lighting
    if sceneView.autoenablesDefaultLighting == false,
       node.attributes[.addDefaultLight]?.bool == true {
      let lightNode = SCNNode()
      lightNode.light = SCNLight()
      lightNode.light?.type = .omni
      lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
      scene.rootNode.addChildNode(lightNode)
    }

    // Render child nodes using SKContext
    for childNode in node.children ?? [] {
      if let scnNode = skContext.renderNode(childNode, messageHandler: messageHandler) {
        scene.rootNode.addChildNode(scnNode)
      }
    }
  }

  private func applyViewProperties(to sceneView: SCNView) {
    // These are SCNView-level properties, NOT per-node properties
    sceneView.allowsCameraControl = node.attributes[.allowsCameraControl]?.bool ?? false
    sceneView.autoenablesDefaultLighting = node.attributes[.autoenablesDefaultLighting]?.bool ?? true
    sceneView.showsStatistics = node.attributes[.showsStatistics]?.bool ?? false

    // Background color
    if let hex = node.attributes[.backgroundColor]?.string {
      sceneView.backgroundColor = HexColor.colorFromHex(hex)
    }
    else {
      sceneView.backgroundColor = .clear
    }

    // Opacity support
    if let opaque = node.attributes[.opaque]?.bool {
      sceneView.isOpaque = opaque
    }
  }

  private func updateSceneProperties(sceneView: SCNView) {
    applyViewProperties(to: sceneView)
  }
}
