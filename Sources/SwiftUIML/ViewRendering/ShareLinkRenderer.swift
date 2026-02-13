import SwiftUI
import SwiftUIMLCore

public struct ShareLinkRenderer: ViewRenderer {
  public static let type: ViewType = .shareLink

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    guard
      let urlString = node.attributes[.url]?.string,
      let url = URL(string: urlString)
    else {
      return EmptyView()
    }

    if let title = node.attributes[.title]?.string {
      return ShareLink(title, item: url)
        .applyModifiers(node, context: context, handler: messageHandler)
    }
    else {
      return ShareLink(item: url)
        .applyModifiers(node, context: context, handler: messageHandler)
    }
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 15, alignment: .leading) {
      ShareLinkNode(url: "https://apple.com")
      ShareLinkNode("Share Apple", url: "https://apple.com")
        .font(.headline)
    }
    .padding()
  }
}
