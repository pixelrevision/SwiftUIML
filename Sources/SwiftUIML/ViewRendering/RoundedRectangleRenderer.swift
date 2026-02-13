import SwiftUI
import SwiftUIMLCore
public struct RoundedRectangleRenderer: ViewRenderer {
  public static let type: ViewType = .roundedRectangle

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let cornerRadius = node.attributes[.cornerRadius]?.cgFloat ?? 8

    // Create node with cornerRadius filtered out since it's used for shape construction
    var filteredNode = node
    filteredNode.attributes.removeFirst(forKey: .cornerRadius)

    return ShapeStyleApplicator.applyStyle(
      to: RoundedRectangle(cornerRadius: cornerRadius),
      node: filteredNode,
      context: context,
      messageHandler: messageHandler
    )
  }
}

#Preview {
  DebugView {
    RoundedRectangleNode(cornerRadius: 16)
      .fill("#5856D6")
      .frame(width: 200, height: 100)
    
    RoundedRectangleNode(cornerRadius: 16)
      .stroke("#5856D6")
      .trim(to: 0.75)
      .frame(width: 200, height: 100)
  }
}
