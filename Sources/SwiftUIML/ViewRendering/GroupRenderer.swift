import SwiftUI
import SwiftUIMLCore

public struct GroupRenderer: ViewRenderer {
  public static let type: ViewType = .group

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return Group {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    GroupNode {
      TextNode("Item 1")
      TextNode("Item 2")
      TextNode("Item 3")
    }
  }
}
