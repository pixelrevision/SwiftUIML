import SwiftUI
import SwiftUIMLCore

public struct ControlGroupRenderer: ViewRenderer {
  public static let type: ViewType = .controlGroup

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return ControlGroup {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      // Basic ControlGroup with buttons
      ControlGroupNode {
        ButtonNode("Bold", onTap: "bold")
        ButtonNode("Italic", onTap: "italic")
        ButtonNode("Underline", onTap: "underline")
      }
    }
    .padding()
  }
}
