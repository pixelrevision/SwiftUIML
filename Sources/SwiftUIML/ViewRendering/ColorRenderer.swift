import SwiftUI
import SwiftUIMLCore
public struct ColorRenderer: ViewRenderer {
  public static let type: ViewType = .color

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    guard let value = node.attributes[.value] else {
      return EmptyView()
    }
    return Color(value)?
      .applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    ColorNode("#FF0000")
    ColorNode("#0000FF33")
    ColorNode("#000000:#FFFFFF")
    ColorNode("#FF000033:#00FF0033")
  }
}
