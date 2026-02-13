import SwiftUI
import SwiftUIMLCore
public struct AsyncImageRenderer: ViewRenderer {
  public static let type: ViewType = .asyncImage

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    guard
      let url = node.attributes[.url]?.url
    else {
      return EmptyView()
    }

    return AsyncImagePhaseView(
      url: url,
      node: node,
      context: context,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

/// Internal view that handles AsyncImage phase rendering
private struct AsyncImagePhaseView: View {
  let url: URL
  let node: Node
  let context: RenderContext
  let messageHandler: MessageHandler?
  
  // Extract phase-specific child nodes once at init
  let emptyNode: Node?
  let successNode: Node?
  let failureNode: Node?
  
  init(url: URL, node: Node, context: RenderContext, messageHandler: MessageHandler?) {
    self.url = url
    self.node = node
    self.context = context
    self.messageHandler = messageHandler
    
    // Find phase-specific child nodes
    self.emptyNode = node.children?.first { $0.type == .asyncImageEmpty }
    self.successNode = node.children?.first { $0.type == .asyncImageSuccess }
    self.failureNode = node.children?.first { $0.type == .asyncImageFailure }
  }
  
  var body: some View {
    AsyncImage(url: url) { phase in
      switch phase {
      case .empty:
        if let emptyNode = emptyNode, let children = emptyNode.children {
          Group {
            ForEach(children, id: \.id) { child in
              NodeView(child, messageHandler: messageHandler)
            }
          }
        }
        else {
          EmptyView()
        }
      case .success(let image):
        if let successNode = successNode {
          // Apply modifiers from the success node to the loaded image
          image.applyModifiers(successNode, context: context, handler: messageHandler)
        }
        else {
          // Apply modifiers from the parent AsyncImage node
          image.applyModifiers(node, context: context, handler: messageHandler)
        }
      case .failure:
        if let failureNode = failureNode, let children = failureNode.children {
          Group {
            ForEach(children, id: \.id) { child in
              NodeView(child, messageHandler: messageHandler)
            }
          }
        }
        else {
          EmptyView()
        }
      @unknown default:
        EmptyView()
      }
    }
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      // Simple usage with default phases
      AsyncImageNode(url: "https://i.imgur.com/CtGQC5J.png")
        .resizable()
        .aspectRatio("1:1", contentMode: .fit)
        .frame(width: 100, height: 100)
      
      // Usage with custom phase views
      AsyncImageNode(url: "https://i.imgur.com/CtGQC5J.png") {
        AsyncImageEmptyNode {
          ProgressViewNode()
        }
        AsyncImageSuccessNode()
          .resizable()
          .aspectRatio("1:1", contentMode: .fit)
          .cornerRadius(8)
        AsyncImageFailureNode {
          VStackNode(spacing: 8) {
            ImageNode(systemName: "exclamationmark.triangle")
              .foregroundColor("#FF0000")
            TextNode("Failed to load")
              .font(.caption)
          }
        }
      }
      .frame(width: 100, height: 100)
    }
    .padding()
  }
}
