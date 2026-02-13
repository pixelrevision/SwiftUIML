import SwiftUI
import SwiftUIMLCore

public struct ToolbarModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .toolbar

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let contentNode = value.node else {
      return nil
    }
    return view.toolbar {
      // If the content node has children, render them directly
      // This allows multiple toolbar items to be properly distributed
      if let children = contentNode.children, !children.isEmpty {
        ForEach(children, id: \.id) { childNode in
          NodeView(childNode, messageHandler: messageHandler)
        }
      }
      else {
        // Single node (e.g., a button or text)
        NodeView(contentNode, messageHandler: messageHandler)
      }
    }
  }
}

#Preview {
  DebugView {
    NavigationStackNode {
      TextNode("Content")
        .toolbar {
          ButtonNode("Action", onTap: "action")
        }
        .navigationTitle("Nav Title")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}
