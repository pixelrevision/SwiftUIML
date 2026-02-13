import SwiftUI
import SwiftUIMLCore
public struct VStackRenderer: ViewRenderer {
  public static let type: ViewType = .vStack

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let spacing = node.attributes[.spacing]?.cgFloat
    return VStack(alignment: .init(node.attributes[.alignment]?.string), spacing: spacing) {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 8, alignment: .leading) {
      ColorNode("#FF000033")
      ColorNode("#00FF0033")
      ColorNode("#0000FF33")
      ColorNode("#FFFF0033")
      ColorNode("#FF00FF33")
    }
    .padding()
  }
}
