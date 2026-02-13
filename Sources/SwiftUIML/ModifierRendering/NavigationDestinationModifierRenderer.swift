import SwiftUI
import SwiftUIMLCore

public struct NavigationDestinationModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .navigationDestination

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let dict = value.dict else {
      return nil
    }

    let destinationValue = dict[.value]?.string ?? ""
    let isPresented = dict[.isPresented]?.bool ?? false
    let contentNode = dict[.content]?.node
    let onPresented = dict[.onPresented]
    let onDismiss = dict[.onDismiss]
    let destinationId = dict[.id]?.string ?? "nav-destination"

    guard let contentNode = contentNode else {
      return nil
    }

    return NavigationDestinationWrapper(
      destinationId: destinationId,
      destinationValue: destinationValue,
      isPresented: isPresented,
      contentNode: contentNode,
      onPresented: onPresented,
      onDismiss: onDismiss,
      messageHandler: messageHandler,
      wrappedView: { AnyView(view) }
    )
  }
}

private struct NavigationDestinationWrapper<Content: View>: View {
  let destinationId: String
  let destinationValue: String
  let isPresented: Bool
  let contentNode: Node
  let onPresented: AttributeValue?
  let onDismiss: AttributeValue?
  let messageHandler: MessageHandler?
  let wrappedView: () -> Content

  @Environment(\.navigationPath) var navigationPath
  @Environment(\.renderContext) var context
  @State private var hasPresented = false

  var body: some View {
    wrappedView()
      .navigationDestination(for: String.self) { value in
        if value == destinationValue {
          NodeView(contentNode, messageHandler: wrappedMessageHandler)
        }
      }
      .onAppear {
        if isPresented && !hasPresented {
          navigationPath?.wrappedValue.append(destinationValue)
          hasPresented = true

          if let onPresented = onPresented {
            wrappedMessageHandler?(onPresented)
          }
        }
      }
      .onChange(of: isPresented) { _, newValue in
        if newValue && !hasPresented {
          navigationPath?.wrappedValue.append(destinationValue)
          hasPresented = true

          if let onPresented = onPresented {
            wrappedMessageHandler?(onPresented)
          }
        }
        else if !newValue && hasPresented {
          // Pop if needed
          if let path = navigationPath?.wrappedValue,
            !path.isEmpty {
            navigationPath?.wrappedValue.removeLast()
          }
          hasPresented = false

          if let onDismiss = onDismiss {
            wrappedMessageHandler?(onDismiss)
          }
        }
      }
  }

  /// Wraps the message handler to add presentedId to context
  private var wrappedMessageHandler: MessageHandler? {
    guard let messageHandler = messageHandler else { return nil }

    return { payload in
      let wrappedMessage = wrapMessage(payload, addingToContext: [
        .presentedId: AttributeValue(destinationId),
      ])

      messageHandler(wrappedMessage)
    }
  }
}
