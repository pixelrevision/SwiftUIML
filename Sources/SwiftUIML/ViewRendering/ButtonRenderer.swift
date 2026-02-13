import SwiftUI
import SwiftUIMLCore
public struct ButtonRenderer: ViewRenderer {
  public static let type: ViewType = .button

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let tap = node.attributes[.onTap] ?? .null

    // Check if there are children
    if let children = node.children, !children.isEmpty {
      return Button {
        messageHandler?(tap)
      } label: {
        ForEach(children, id: \.id) { childNode in
          NodeView(childNode, messageHandler: messageHandler)
        }
      }.applyModifiers(node, context: context, handler: messageHandler)
    }
    else {
      // Fallback to title-based button
      let title = node.attributes[.title]?.string ?? ""
      return Button(title) {
        messageHandler?(tap)
      }.applyModifiers(node, context: context, handler: messageHandler)
    }
  }
}

#Preview {
  DebugView {
    ButtonNode("Tap Me", onTap: "buttonTapped")
      .font(size: 16, weight: .semibold)
      .padding(12)
      .backgroundColor("#007AFF")
      .foregroundColor("#FFFFFF")
      .cornerRadius(8)

    ButtonNode(onTap: "add") {
      ImageNode(systemName: "plus")
      TextNode("Additional text")
    }
    .font(size: 16, weight: .semibold)
    .padding(12)
    .backgroundColor("#007AFF")
    .foregroundColor("#FFFFFF")
    .cornerRadius(8)
  }
}
