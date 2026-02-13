import SwiftUI
import SwiftUIMLCore

public struct LazyVGridRenderer: ViewRenderer {
  public static let type: ViewType = .lazyVGrid

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let columns = node.attributes[.columns]?.int ?? 2
    let alignment = HorizontalAlignment(node.attributes[.alignment]?.string)
    let spacing = node.attributes[.spacing]?.cgFloat

    // Create flexible columns
    let gridItems = Array(repeating: GridItem(.flexible(), spacing: spacing), count: columns)

    return LazyVGrid(columns: gridItems, alignment: alignment, spacing: spacing) {
      if let children = node.children {
        ForEach(children, id: \.id) { childNode in
          NodeView(childNode, messageHandler: messageHandler)
        }
      }
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    LazyVGridNode(columns: 3, spacing: 8) {
      ForEachNode(1...12) { i in
        TextNode("\(i)")
          .frame(height: 50)
          .frame(maxWidth: .infinity)
          .backgroundColor("#34C759")
          .foregroundColor("#FFFFFF")
          .cornerRadius(8)
      }
    }
    .padding()
  }
}
