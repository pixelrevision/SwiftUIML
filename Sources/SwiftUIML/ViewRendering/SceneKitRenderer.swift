import SwiftUI
import SwiftUIMLCore
import SceneKit

public struct SceneKitRenderer: ViewRenderer {
  public static let type: ViewType = .sceneKit

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return WrappedSceneKitView(node: node, messageHandler: messageHandler)
      .applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  SceneKitPreview()
}

struct SceneKitPreview: View {
  var body: some View {
    DebugView {
      ZStackNode {
        SceneKitNode {
          SKCubeNode(
            width: 2.0,
            height: 2.0,
            length: 2.0,
            chamferRadius: 0.1
          )
        }
        .supportsOpacity()
        .allowsCameraControl()
        .autoenablesDefaultLighting()
        // .showsStatistics()
        .addDefaultCamera()
        .frame(height: 300)
        .padding(leading: 20, trailing: 20)
        
        TextNode("Scene Kit")
          .backgroundColor("#00FF00")
      }
      .backgroundColor("#FF0000")
    }
  }
}
