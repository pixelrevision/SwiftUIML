import SwiftUI
import SwiftUIMLCore
public struct SpacerRenderer: ViewRenderer {
  public static let type: ViewType = .spacer

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return Spacer().applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    SpacerNode()
    
    ColorNode("#0000FF33")
    
    SpacerNode()
    
    ColorNode("#FF000033")
    
    SpacerNode()
  }
}
