import SwiftUI
import SwiftUIMLCore
public struct RectangleRenderer: ViewRenderer {
  public static let type: ViewType = .rectangle

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return ShapeStyleApplicator.applyStyle(
      to: Rectangle(),
      node: node,
      context: context,
      messageHandler: messageHandler
    )
  }
}

#Preview {
  DebugView {
    RectangleNode()
      .fill("#34C759")
      .frame(width: 200, height: 100)
    
    RectangleNode()
      .stroke("#34C759")
      .trim(to: 0.83)
      .frame(width: 200, height: 100)
  }
}
