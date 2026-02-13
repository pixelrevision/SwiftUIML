import SwiftUI
import SwiftUIMLCore
extension View {
  /// Listen for messages from the MessageQueue
  public func onMessage(
    nodeId: String? = nil,
    perform action: @escaping (AttributeValue) -> Void
  ) -> some View {
    modifier(MessageListenerModifier(nodeId: nodeId, action: action))
  }
}

private struct MessageListenerModifier: ViewModifier {
  let nodeId: String?
  let action: (AttributeValue) -> Void

  @Environment(\.messageQueue) var messageQueue

  func body(content: Content) -> some View {
    content
      .onReceive(messageQueue.$latest) { message in
        guard let message = message else {
          return
        }
        // If we have a nodeId, check if message is for this node
        if let nodeId = nodeId {
          if let dict = message.dict {
            // Check if message has a target nodeId
            if let targetNodeId = dict[.nodeId]?.string {
              // Message is targeted - only handle if it matches our ID
              guard targetNodeId == nodeId else {
                return
              }
            }
          }
        }
        action(message)
      }
  }
}
