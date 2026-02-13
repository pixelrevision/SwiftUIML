import SwiftUI
import SwiftUIMLCore
public struct CapsuleRenderer: ViewRenderer {
  public static let type: ViewType = .capsule

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return ShapeStyleApplicator.applyStyle(
      to: Capsule(),
      node: node,
      context: context,
      messageHandler: messageHandler
    )
  }
}

#Preview {
  DebugView {
    CapsuleNode()
      .fill("#FF9500")
      .frame(width: 200, height: 44)
    
    CapsuleNode()
      .stroke("#FF9500")
      .frame(width: 200, height: 44)
  }
}
