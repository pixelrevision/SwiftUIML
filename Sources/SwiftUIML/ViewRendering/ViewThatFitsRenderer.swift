import SwiftUI
import SwiftUIMLCore
public struct ViewThatFitsRenderer: ViewRenderer {
  public static let type: ViewType = .viewThatFits

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let axis = Axis.Set(node.attributes[.axis])
    return ViewThatFits(in: axis) {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    ForEachNode(1...3) { index in
      ViewThatFitsNode(axis: .horizontal) {
        TextNode("Long")
          .frame(minWidth: 150)
        TextNode("Medium")
          .frame(minWidth: 100)
        TextNode("Short")
          .frame(minWidth: 50)
      }
      .frame(width: Double(index) * 50, height: 100)
      .backgroundColor("#0000FF33")
    }
  }
}
