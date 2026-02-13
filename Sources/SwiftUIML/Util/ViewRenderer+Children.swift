import SwiftUI
import SwiftUIMLCore
func NodeChildViews(for node: Node, messageHandler: MessageHandler?) -> ForEach<[Node], String, NodeView>? {
  if let children = node.children {
    return ForEach(children, id: \.id) { child in
      NodeView(child, messageHandler: messageHandler)
    }
  }
  return nil
}
