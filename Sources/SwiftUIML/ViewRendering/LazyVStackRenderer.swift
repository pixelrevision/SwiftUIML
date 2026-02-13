import SwiftUI
import SwiftUIMLCore
public struct LazyVStackRenderer: ViewRenderer {
  public static let type: ViewType = .lazyVStack

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let spacing = node.attributes[.spacing]?.cgFloat
    return LazyVStack(alignment: .init(node.attributes[.alignment]?.string), spacing: spacing) {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    ScrollViewNode(axis: .vertical) {
      LazyVStackNode(spacing: 0, alignment: .leading) {
        ForEachNode(1...100) { index in
          TextNode("Item \(index)")
            .padding(12)
          if index < 100 {
            DividerNode()
          }
        }
      }
    }
    .padding()
  }
}
