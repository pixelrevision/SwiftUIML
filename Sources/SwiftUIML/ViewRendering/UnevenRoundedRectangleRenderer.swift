import SwiftUI
import SwiftUIMLCore

public struct UnevenRoundedRectangleRenderer: ViewRenderer {
  public static let type: ViewType = .unevenRoundedRectangle

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let topLeading = node.attributes[.topLeading]?.cgFloat ?? 0
    let bottomLeading = node.attributes[.bottomLeading]?.cgFloat ?? 0
    let bottomTrailing = node.attributes[.bottomTrailing]?.cgFloat ?? 0
    let topTrailing = node.attributes[.topTrailing]?.cgFloat ?? 0

    let cornerRadii = RectangleCornerRadii(
      topLeading: topLeading,
      bottomLeading: bottomLeading,
      bottomTrailing: bottomTrailing,
      topTrailing: topTrailing
    )

    // Create node with corner radii filtered out since they're used for shape construction
    var filteredNode = node
    filteredNode.attributes.removeFirst(forKey: .topLeading)
    filteredNode.attributes.removeFirst(forKey: .bottomLeading)
    filteredNode.attributes.removeFirst(forKey: .bottomTrailing)
    filteredNode.attributes.removeFirst(forKey: .topTrailing)

    return ShapeStyleApplicator.applyStyle(
      to: UnevenRoundedRectangle(cornerRadii: cornerRadii),
      node: filteredNode,
      context: context,
      messageHandler: messageHandler
    )
  }
}

#Preview {
  DebugView {
    UnevenRoundedRectangleNode(
      topLeading: 30,
      bottomLeading: 10,
      bottomTrailing: 30,
      topTrailing: 10
    )
    .fill("#5856D6")
    .frame(width: 200, height: 100)

    UnevenRoundedRectangleNode(
      topLeading: 30,
      bottomLeading: 10,
      bottomTrailing: 30,
      topTrailing: 10
    )
    .stroke("#5856D6", lineWidth: 3)
    .frame(width: 200, height: 100)
  }
}
