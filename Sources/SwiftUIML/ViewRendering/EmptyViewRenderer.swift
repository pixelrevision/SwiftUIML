import SwiftUI
import SwiftUIMLCore

public struct EmptyViewRenderer: ViewRenderer {
  public static let type: ViewType = .emptyView

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return EmptyView()
      .applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 10) {
      TextNode("Before Empty")
      EmptyViewNode()
      TextNode("After Empty")
    }
    .padding()
  }
}
