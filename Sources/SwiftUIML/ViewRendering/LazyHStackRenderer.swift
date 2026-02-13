import SwiftUI
import SwiftUIMLCore
public struct LazyHStackRenderer: ViewRenderer {
  public static let type: ViewType = .lazyHStack

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let spacing = node.attributes[.spacing]?.cgFloat
    return LazyHStack(alignment: .init(node.attributes[.alignment]?.string), spacing: spacing) {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    ScrollViewNode(axis: .horizontal) {
      LazyHStackNode(spacing: 8, alignment: .center) {
        ForEachNode(1...100) { index in
          VStackNode(spacing: 4) {
            ColorNode("#FF000033")
              .frame(width: 60, height: 60)
            TextNode("Item \(index)")
              .font(.caption)
          }
        }
      }
    }
    .padding()
  }
}
