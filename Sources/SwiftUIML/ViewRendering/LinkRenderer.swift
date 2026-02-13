import SwiftUI
import SwiftUIMLCore

public struct LinkRenderer: ViewRenderer {
  public static let type: ViewType = .link

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    guard
      let urlString = node.attributes[.url]?.string,
      let url = URL(string: urlString)
    else {
      return EmptyView()
    }

    // Check if there are children for custom label
    if let children = node.children, !children.isEmpty {
      return Link(destination: url) {
        NodeChildViews(for: node, messageHandler: messageHandler)
      }.applyModifiers(node, context: context, handler: messageHandler)
    }
    else {
      // Fallback to title-based link
      let title = node.attributes[.title]?.string ?? urlString
      return Link(title, destination: url)
        .applyModifiers(node, context: context, handler: messageHandler)
    }
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20, alignment: .leading) {
      LinkNode("Visit Apple", url: "https://apple.com")
      LinkNode(url: "https://github.com") {
        HStackNode(spacing: 8) {
          ImageNode(systemName: "link")
          TextNode("GitHub")
        }
      }
    }
    .padding()
  }
}
