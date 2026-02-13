import SwiftUI
import SwiftUIMLCore

public struct ContainerRelativeShapeRenderer: ViewRenderer {
  public static let type: ViewType = .containerRelativeShape

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return ShapeStyleApplicator.applyStyle(
      to: ContainerRelativeShape(),
      node: node,
      context: context,
      messageHandler: messageHandler
    )
  }
}

#Preview {
  // Note: ContainerRelativeShape adapts to its container's shape.
  // Most useful in widget contexts where containers have defined shapes.
  // In a basic view context, it renders as a rectangle.
  DebugView {
    VStackNode(spacing: 20) {
      // As a filled background
      TextNode("Container Shape")
        .padding()
        .background(
          ContainerRelativeShapeNode()
            .fill("#007AFF")
        )

      // With stroke
      TextNode("With Border")
        .padding()
        .background(
          ContainerRelativeShapeNode()
            .stroke("#FF375F", lineWidth: 2)
        )
    }
  }
}
