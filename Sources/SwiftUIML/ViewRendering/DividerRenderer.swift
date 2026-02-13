import SwiftUI
import SwiftUIMLCore
public struct DividerRenderer: ViewRenderer {
  public static let type: ViewType = .divider

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return Divider().applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    TextNode("Section 1")
      .font(.headline)
      .padding(12)
    
    DividerNode()
    
    TextNode("Content line 1").padding(12)
    TextNode("Content line 2").padding(12)
    
    DividerNode()
    
    TextNode("Section 2")
      .font(.headline)
      .padding(12)
    
    DividerNode()
    
    TextNode("Content line 3").padding(12)
  }.padding()
}
