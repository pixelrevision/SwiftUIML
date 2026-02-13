import SwiftUI
import SwiftUIMLCore
public struct ColorSchemeRenderer: ViewRenderer {
  public static let type: ViewType = .colorScheme

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let children = node.children ?? []
    guard !children.isEmpty else {
      return EmptyView()
    }
    // [0] = light mode, [1] = dark mode
    // If dark mode not available, use light mode for both
    // If neither available, use EmptyView
    let lightChild = children.count >= 1 ? children[0] : nil
    let darkChild = children.count >= 2 ? children[1] : lightChild

    return ColorSchemeWrapper(
      lightNode: lightChild,
      darkNode: darkChild,
      context: context,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

/// Internal view that switches content based on color scheme
private struct ColorSchemeWrapper: View {
  let lightNode: Node?
  let darkNode: Node?
  let context: RenderContext
  let messageHandler: MessageHandler?
  
  @Environment(\.colorScheme) private var colorScheme
  
  var body: some View {
    Group {
      if colorScheme == .dark {
        if let darkNode = darkNode {
          NodeView(darkNode, messageHandler: messageHandler)
        }
        else {
          EmptyView()
        }
      }
      else {
        if let lightNode = lightNode {
          NodeView(lightNode, messageHandler: messageHandler)
        }
        else {
          EmptyView()
        }
      }
    }
  }
}

#Preview {
  DebugView {
    ColorSchemeNode {
      // [0] Light mode content
      VStackNode(spacing: 8) {
        TextNode("☀️ Light Mode")
          .font(.title)
      }
      // [1] Dark mode content
      VStackNode(spacing: 8) {
        TextNode("🌙 Dark Mode")
          .font(.title)
          .foregroundColor("#FFFFFF")
      }
    }
    .padding()
  }
}
