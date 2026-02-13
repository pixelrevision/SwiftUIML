import SwiftUI
import SwiftUIMLCore

public struct NavigationLinkRenderer: ViewRenderer {
  public static let type: ViewType = .navigationLink

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return NavigationLinkView(node: node, context: context, messageHandler: messageHandler)
  }
}

private struct NavigationLinkView: View {
  let node: Node
  let context: RenderContext
  let messageHandler: MessageHandler?

  @Environment(\.navigationPath) private var navigationPath

  var body: some View {
    let value = node.attributes[.value]?.string ?? ""

    Button {
      // Append the value to the navigation path
      navigationPath?.wrappedValue.append(value)
    } label: {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }
    .buttonStyle(.plain)
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    NavigationStackNode {
      VStackNode(spacing: 16) {
        NavigationLinkNode("Go to Settings", value: "settings")
          .padding(12)
          .backgroundColor("#34C759")
          .foregroundColor("#FFFFFF")
          .cornerRadius(8)
        NavigationLinkNode("Go to Detail", value: "detail")
          .padding(12)
          .backgroundColor("#007AFF")
          .foregroundColor("#FFFFFF")
          .cornerRadius(8)
      }
      .padding()
      .navigationTitle("Home")
      .navigationDestinations {
        VStackNode {
          TextNode("Settings View")
            .font(.title)
            .padding()
        }
        .navigationDestinationKey("settings")
        .navigationTitle("Settings")

        VStackNode {
          TextNode("Detail View")
            .font(.title)
            .padding()
        }
        .navigationDestinationKey("detail")
        .navigationTitle("Detail")
      }
    }
  }
}
