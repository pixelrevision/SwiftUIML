import SwiftUI
import SwiftUIMLCore

public struct MenuRenderer: ViewRenderer {
  public static let type: ViewType = .menu

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    guard let children = node.children, !children.isEmpty else {
      return EmptyView()
    }

    // Check if there's a label attribute
    if let labelText = node.attributes[.label]?.string {
      // Text label with menu items as children
      return Menu(labelText) {
        ForEach(children, id: \.id) { childNode in
          NodeView(childNode, messageHandler: messageHandler)
        }
      }.applyModifiers(node, context: context, handler: messageHandler)
    }
    else if let labelNode = node.attributes[.label]?.node {
      return Menu {
        ForEach(children, id: \.id) { childNode in
          NodeView(childNode, messageHandler: messageHandler)
        }
      }
      label: {
        NodeView(labelNode, messageHandler: messageHandler)
      }.applyModifiers(node, context: context, handler: messageHandler)
    }
    else {
      return EmptyView()
    }
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      // Simple text label menu
      MenuNode("Options") {
        ButtonNode("Action 1", onTap: "action1")
        ButtonNode("Action 2", onTap: "action2")
        ButtonNode("Action 3", onTap: "action3")
      }

      // Custom label menu
      MenuNode(label: LabelNode("Settings", systemImage: "gear")) {
        ButtonNode("Profile", onTap: "profile")
        ButtonNode("Preferences", onTap: "preferences")
        DividerNode()
        ButtonNode("Logout", onTap: "logout")
      }
    }
    .padding()
  }
}
