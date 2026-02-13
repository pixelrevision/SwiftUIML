import SwiftUI
import SwiftUIMLCore

public struct AlertModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .alert

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let dict = value.dict else {
      return nil
    }

    let title = dict[.title]?.string ?? ""
    let message = dict[.message]?.string
    let isPresented = dict[.isPresented]?.bool ?? false
    let buttons = dict[.buttons]?.array ?? []
    let onDismiss = dict[.onDismiss]
    let alertId = dict[.id]?.string ?? "alert"

    return AlertWrapper(
      alertId: alertId,
      title: title,
      message: message,
      isPresented: isPresented,
      buttons: buttons,
      onDismiss: onDismiss,
      messageHandler: messageHandler,
      content: { AnyView(view) }
    )
  }
}

private struct AlertWrapper<Content: View>: View {
  let alertId: String
  let title: String
  let message: String?
  let isPresented: Bool
  let buttons: [AttributeValue]
  let onDismiss: AttributeValue?
  let messageHandler: MessageHandler?
  let content: () -> Content

  @State private var isPresentedState: Bool = false

  var body: some View {
    content()
      .alert(title, isPresented: $isPresentedState) {
        ForEach(Array(buttons.enumerated()), id: \.offset) { _, buttonValue in
          if let buttonDict = buttonValue.dict {
            createButton(from: buttonDict)
          }
        }
      } message: {
        if let message = message {
          Text(message)
        }
      }
      .onChange(of: isPresented) { _, newValue in
        isPresentedState = newValue
      }
      .onAppear {
        isPresentedState = isPresented
      }
  }

  @ViewBuilder
  private func createButton(from dict: [AttributeKey: AttributeValue]) -> some View {
    let label = dict[.label]?.string ?? "OK"
    let roleString = dict[.role]?.string
    let action = dict[.action]

    Button(role: ButtonRole(roleString)) {
      // Send button action message
      if let action = action {
        wrappedMessageHandler?(action)
      }

      // Send onDismiss if this isn't a cancel button
      if roleString != "cancel", let onDismiss = onDismiss {
        wrappedMessageHandler?(onDismiss)
      }
    } label: {
      Text(label)
    }
  }

  /// Wraps the message handler to add presentedId to context
  private var wrappedMessageHandler: MessageHandler? {
    guard let messageHandler = messageHandler else { return nil }

    return { payload in
      let wrappedMessage = wrapMessage(payload, addingToContext: [
        .presentedId: AttributeValue(alertId),
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
    .alert(
      title: "Delete Item?",
      message: "This action cannot be undone",
      buttons: [
        .cancel("Cancel"),
        .destructive("Delete", action: "deleteItem"),
      ]
    )
  }
}
