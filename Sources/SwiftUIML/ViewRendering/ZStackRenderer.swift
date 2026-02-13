import SwiftUI
import SwiftUIMLCore
public struct ZStackRenderer: ViewRenderer {
  public static let type: ViewType = .zStack

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return ZStack(alignment: Alignment(node.attributes[.alignment]?.string)) {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    ZStackNode(alignment: .center) {
      ColorNode("#FF000033")
        .frame(width: 250, height: 250)
      ColorNode("#00FF0033")
        .frame(width: 200, height: 200)
      ColorNode("#0000FF33")
        .frame(width: 150, height: 150)
      ColorNode("#FFFF0033")
        .frame(width: 100, height: 100)
      ColorNode("#FF00FF33")
        .frame(width: 50, height: 50)
    }
    .padding()
  }
}
