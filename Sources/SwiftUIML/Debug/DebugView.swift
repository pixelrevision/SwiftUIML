import SwiftUI
import SwiftUIMLCore
public struct DebugView: View {
  public enum Display: String {
    case renderer
    case tree
    case json
  }

  let node: Node
  let messageHandler: MessageHandler?
  @State private var display = Display.renderer

  public init(_ node: Node, messageHandler: MessageHandler? = nil) {
    self.node = node
    self.messageHandler = messageHandler
  }

  public init(@NodeBuilder content: () -> [Node]) {
    self.node = VStackNode {
      content()
    }
    self.messageHandler = nil
  }
  
  public func messageHandler(_ handler: @escaping MessageHandler) -> Self {
    DebugView(node, messageHandler: handler)
  }

  public var body: some View {
    VStack(spacing: 0) {
      Picker("Display", selection: $display) {
        Text("🖌️ Rendered").tag(Display.renderer)
        Text("🌳 Tree").tag(Display.tree)
        Text("🧑‍💻 JSON").tag(Display.json)
      }
      .font(.system(.body, design: .monospaced))
      .pickerStyle(.segmented)
      .padding()
      switch display {
      case .renderer: NodeView(node, messageHandler: messageHandler)
      case .tree: TreeView(node: node)
      case .json: JSONView(node: node)
      }
    }
    .frame(maxHeight: .infinity, alignment: .topLeading)
  }
}
