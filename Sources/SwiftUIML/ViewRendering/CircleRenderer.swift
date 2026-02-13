import SwiftUI
import SwiftUIMLCore
public struct CircleRenderer: ViewRenderer {
  public static let type: ViewType = .circle

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return ShapeStyleApplicator.applyStyle(
      to: Circle(),
      node: node,
      context: context,
      messageHandler: messageHandler
    )
  }
}

#Preview {
  DebugView {
    CircleNode()
      .fill("#007AFF")
      .frame(width: 100, height: 100)
    
    CircleNode()
      .stroke("#007AFF", lineWidth: 5)
      .frame(width: 100, height: 100)
    
    CircleNode()
      .trim(to: 0.75)
      .stroke("#34C759", lineWidth: 8)
      .frame(width: 100, height: 100)
    
    CircleNode()
      .trim(from: 0.25, to: 0.75)
      .stroke("#FF9500", lineWidth: 8)
      .frame(width: 100, height: 100)
  }
}
