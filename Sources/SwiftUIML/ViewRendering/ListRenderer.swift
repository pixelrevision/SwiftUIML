import SwiftUI
import SwiftUIMLCore
public struct ListRenderer: ViewRenderer {
  public static let type: ViewType = .list

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return List {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    ListNode {
      ForEachNode(1...20) { index in
        TextNode("Item \(index)")
      }
    }
  }
}
