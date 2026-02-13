import SwiftUI
import SwiftUIMLCore
public typealias MessageHandler = (AttributeValue) -> Void

public struct NodeView: View, Equatable {
  let node: Node
  @Environment(\.renderContext) var context
  let messageHandler: MessageHandler?

  public init(_ node: Node, messageHandler: MessageHandler? = nil) {
    self.node = node
    self.messageHandler = messageHandler
  }

  public init(@NodeBuilder content: () -> [Node]) {
    self.init(VStackNode { content() })
  }

  public static func == (lhs: NodeView, rhs: NodeView) -> Bool {
    lhs.node == rhs.node
  }

  public var body: some View {
    let baseView = EquatableNodeBody(node: node, context: context, messageHandler: messageHandler)

    // Some modifiers don't work through .equatable() - skip if flagged
    if node.attributes[.ignoreEquatable]?.bool == true {
      return AnyView(baseView)
    }
    else {
      return AnyView(baseView.equatable())
    }
  }

  public func messageHandler(_ handler: @escaping MessageHandler) -> Self {
    return Self(node, messageHandler: handler)
  }
}

/// Wrapper to prevent potential equality issues
/// with @Environment render context in node.
private struct EquatableNodeBody: View, Equatable {
  let node: Node
  let context: RenderContext
  let messageHandler: MessageHandler?

  static func == (lhs: EquatableNodeBody, rhs: EquatableNodeBody) -> Bool {
    lhs.node == rhs.node
  }

  var body: some View {
    if let renderer = context.view(for: node.type) {
      AnyView(renderer.render(node: node, context: context, messageHandler: wrappedMessageHandler))
    }
    else {
      EmptyView()
    }
  }
  
  /// Wraps the message handler to add node.id to context
  private var wrappedMessageHandler: MessageHandler? {
    guard let messageHandler = messageHandler else {
      return nil
    }
    return { payload in
      let wrappedMessage = wrapMessage(payload, addingToContext: [
        .nodeId: AttributeValue(node.id),
      ])
      messageHandler(wrappedMessage)
    }
  }
}

#Preview {
  DebugView {
    TextNode("Hello World")
  }
  .padding()
}
