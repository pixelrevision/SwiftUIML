import SwiftUI
import SwiftUIMLCore

public struct LazyHGridRenderer: ViewRenderer {
  public static let type: ViewType = .lazyHGrid
  
  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let rows = node.attributes[.rows]?.int ?? 2
    let alignment = VerticalAlignment(node.attributes[.alignment]?.string)
    let spacing = node.attributes[.spacing]?.cgFloat
    
    // Create flexible rows
    let gridItems = Array(repeating: GridItem(.flexible(), spacing: spacing), count: rows)
    
    return LazyHGrid(rows: gridItems, alignment: alignment, spacing: spacing) {
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
    LazyHGridNode(rows: 2, spacing: 8) {
      ForEachNode(1...12) { i in
        TextNode("\(i)")
          .frame(width: 50, height: 50)
          .backgroundColor("#007AFF")
          .foregroundColor("#FFFFFF")
          .cornerRadius(8)
      }
    }
    .frame(height: 120)
  }
}
