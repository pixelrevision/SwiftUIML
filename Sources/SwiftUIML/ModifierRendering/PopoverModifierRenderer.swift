import SwiftUI
import SwiftUIMLCore

public struct PopoverModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .popover

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let dict = value.dict,
      let contentNode = dict[.value]?.node
    else {
      return nil
    }

    let popoverId = dict[.id]?.string ?? contentNode.id
    let isPresented = dict[.isPresented]?.bool ?? false
    let animated = dict[.animated]?.bool ?? true
    let onPresented = dict[.onPresented]
    let onDismiss = dict[.onDismiss]

    return PopoverWrapper(
      popoverId: popoverId,
      isPresented: isPresented,
      animated: animated,
      contentNode: contentNode,
      onPresented: onPresented,
      onDismiss: onDismiss,
      messageHandler: messageHandler,
      content: { AnyView(view) }
    )
  }
}

private struct PopoverWrapper<Content: View>: View {
  let popoverId: String
  let isPresented: Bool
  let animated: Bool
  let contentNode: Node
  let onPresented: AttributeValue?
  let onDismiss: AttributeValue?
  let messageHandler: MessageHandler?
  let content: () -> Content

  @State private var isPresentedState: Bool = false
  @State private var hasPresented: Bool = false

  var body: some View {
    content()
      .popover(
        isPresented: $isPresentedState,
        content: {
          NodeView(contentNode, messageHandler: wrappedMessageHandler)
        }
      )
      .onChange(of: isPresented) { oldValue, newValue in
        if animated {
          isPresentedState = newValue
        }
        else {
          // For non-animated, use transaction
          var transaction = Transaction()
          transaction.disablesAnimations = true
          withTransaction(transaction) {
            isPresentedState = newValue
          }
        }

        // Call onPresented when transitioning from false to true
        if !oldValue && newValue && !hasPresented {
          hasPresented = true
          if let onPresented = onPresented {
            wrappedMessageHandler?(onPresented)
          }
        }
        else if !newValue {
          hasPresented = false
        }
      }
      .onChange(of: isPresentedState) { oldValue, newValue in
        // Call onDismiss when popover is dismissed (state changes from true to false)
        if oldValue && !newValue {
          if let onDismiss = onDismiss {
            wrappedMessageHandler?(onDismiss)
          }
        }
      }
      .onAppear {
        isPresentedState = isPresented
        if isPresented && !hasPresented {
          hasPresented = true
          if let onPresented = onPresented {
            wrappedMessageHandler?(onPresented)
          }
        }
      }
  }

  /// Wraps the message handler to add presentedId to context
  private var wrappedMessageHandler: MessageHandler? {
    guard let messageHandler = messageHandler else { return nil }

    return { payload in
      let wrappedMessage = wrapMessage(payload, addingToContext: [
        .presentedId: AttributeValue(popoverId),
      ])

      messageHandler(wrappedMessage)
    }
  }
}

#Preview {
  DebugView {
    VStackNode {
      TextNode("Main Content")
        .font(.title)
        .padding()
    }
    .popover {
      VStackNode {
        TextNode("Popover Content")
          .font(.headline)
        TextNode("This is inside a popover")
          .padding()
      }
    }
  }
}
