import SwiftUI
import SwiftUIMLCore
public struct GridRenderer: ViewRenderer {
  public static let type: ViewType = .grid

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let horizontalSpacing = node.attributes[.horizontalSpacing]?.cgFloat
    let verticalSpacing = node.attributes[.verticalSpacing]?.cgFloat
    let alignment = Alignment(node.attributes[.alignment]?.string)

    return Grid(alignment: alignment, horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing) {
      // Grid needs actual GridRow types, not AnyView-wrapped NodeViews
      // So we manually render GridRow children here
      if let children = node.children {
        ForEach(children, id: \.id) { childNode in
          if childNode.type == .gridRow {
            let rowAlignment = VerticalAlignment(childNode.attributes[.alignment]?.string)
            GridRow(alignment: rowAlignment) {
              if let rowChildren = childNode.children {
                ForEach(rowChildren, id: \.id) { cellNode in
                  let cellView = NodeView(cellNode, messageHandler: messageHandler)
                  if let columns = cellNode.attributes[.gridCellColumns]?.int {
                    cellView.gridCellColumns(columns)
                  }
                  else {
                    cellView
                  }
                }
              }
            }
            .applyModifiers(childNode, context: context, handler: messageHandler)
          }
          else {
            // Non-GridRow child, render normally
            NodeView(childNode, messageHandler: messageHandler)
          }
        }
      }
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    GridNode(horizontalSpacing: 8, verticalSpacing: 8) {
      GridRowNode {
        ColorNode("#FF0000").frame(width: 80, height: 80)
        ColorNode("#00FF00").frame(width: 80, height: 80)
        ColorNode("#0000FF").frame(width: 80, height: 80)
      }
      GridRowNode {
        ColorNode("#FFFF00").frame(width: 80, height: 80)
        ColorNode("#FF00FF").frame(width: 80, height: 80)
        ColorNode("#00FFFF").frame(width: 80, height: 80)
      }
    }
    .padding()
  }
}
