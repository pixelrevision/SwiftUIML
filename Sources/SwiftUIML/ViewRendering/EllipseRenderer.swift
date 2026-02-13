import SwiftUI
import SwiftUIMLCore
public struct EllipseRenderer: ViewRenderer {
  public static let type: ViewType = .ellipse

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return ShapeStyleApplicator.applyStyle(
      to: Ellipse(),
      node: node,
      context: context,
      messageHandler: messageHandler
    )
  }
}

#Preview {
  DebugView {
    EllipseNode()
      .fill("#AF52DE")
      .frame(width: 200, height: 100)
    
    EllipseNode()
      .stroke("#AF52DE")
      .trim(to: 0.75)
      .frame(width: 200, height: 100)
  }
}
