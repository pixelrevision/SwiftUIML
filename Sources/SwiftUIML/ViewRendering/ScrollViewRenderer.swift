import SwiftUI
import SwiftUIMLCore
public struct ScrollViewRenderer: ViewRenderer {
  public static let type: ViewType = .scrollView

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return ScrollView(Axis.Set(node.attributes[.axis])) {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview("Vertical List") {
  DebugView {
    ScrollViewNode(axis: .vertical) {
      VStackNode(spacing: 0, alignment: .leading) {
        ForEachNode(1...20) { index in
          TextNode("Item \(index)")
            .padding(12)
          if index < 20 {
            DividerNode()
          }
        }
      }
    }
    .padding()
  }
}

#Preview("Carousel") {
  DebugView {
    ScrollViewNode(axis: .horizontal) {
      HStackNode(spacing: 12) {
        ForEachNode(1...8) { index in
          VStackNode(spacing: 8) {
            ColorNode("#\(["FF6B6B", "4ECDC4", "45B7D1", "FFA07A"][index % 4])")
              .frame(width: 140, height: 140)
              .cornerRadius(16)
            TextNode("Item \(index)")
              .font(.caption)
          }
        }
      }
      .scrollTargetLayout()
      .padding()
    }
    .scrollTargetBehavior(.viewAligned)
    .scrollIndicators(.hidden)
  }
}
