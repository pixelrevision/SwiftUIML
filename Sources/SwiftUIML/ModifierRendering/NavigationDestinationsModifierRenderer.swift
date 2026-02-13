import SwiftUI
import SwiftUIMLCore

public struct NavigationDestinationsModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .navigationDestinations

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let destinationNodes = value.array?.compactMap({ $0.node }) else {
      return nil
    }

    // Build a dictionary mapping keys to their destination nodes
    var destinationMap: [String: DestinationConfig] = [:]

    for node in destinationNodes {
      guard let key = node.attributes[.navigationDestinationKey]?.string else {
        continue
      }

      let config = DestinationConfig(
        key: key,
        contentNode: node,
        onPresented: node.attributes[.onPresented],
        onDismiss: node.attributes[.onDismiss],
        destinationId: node.attributes[.id]?.string ?? "nav-destination-\(key)"
      )

      destinationMap[key] = config
    }

    guard !destinationMap.isEmpty else {
      return nil
    }

    return NavigationDestinationsWrapper(
      destinationMap: destinationMap,
      messageHandler: messageHandler,
      wrappedView: { AnyView(view) }
    )
  }
}

private struct DestinationConfig {
  let key: String
  let contentNode: Node
  let onPresented: AttributeValue?
  let onDismiss: AttributeValue?
  let destinationId: String
}

private struct NavigationDestinationsWrapper<Content: View>: View {
  let destinationMap: [String: DestinationConfig]
  let messageHandler: MessageHandler?
  let wrappedView: () -> Content

  @Environment(\.navigationPath) var navigationPath
  @Environment(\.renderContext) var context
  @State private var presentedKeys: Set<String> = []

  var body: some View {
    wrappedView()
      .navigationDestination(for: String.self) { value in
        if let config = destinationMap[value] {
          NodeView(config.contentNode, messageHandler: wrappedMessageHandler(for: config))
            .onAppear {
              if !presentedKeys.contains(config.key) {
                presentedKeys.insert(config.key)
                if let onPresented = config.onPresented {
                  wrappedMessageHandler(for: config)?(onPresented)
                }
              }
            }
            .onDisappear {
              if presentedKeys.contains(config.key) {
                presentedKeys.remove(config.key)
                if let onDismiss = config.onDismiss {
                  wrappedMessageHandler(for: config)?(onDismiss)
                }
              }
            }
        }
      }
  }

  /// Wraps the message handler to add presentedId to context
  private func wrappedMessageHandler(for config: DestinationConfig) -> MessageHandler? {
    guard let messageHandler = messageHandler else { return nil }

    return { payload in
      let wrappedMessage = wrapMessage(payload, addingToContext: [
        .presentedId: AttributeValue(config.destinationId),
      ])

      messageHandler(wrappedMessage)
    }
  }
}
