import SwiftUI
import SwiftUIMLCore

public struct SecureFieldRenderer: ViewRenderer {
  public static let type: ViewType = .secureField

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let placeholder = node.attributes[.placeholder]?.string ?? ""
    let initialValue = node.attributes[.value]?.string ?? ""
    let onTextChange = node.attributes[.onTextChange]
    let onSubmit = node.attributes[.onSubmit]
    let onFocus = node.attributes[.onFocus]
    let onBlur = node.attributes[.onBlur]

    return SecureFieldView(
      placeholder: placeholder,
      initialValue: initialValue,
      onTextChange: onTextChange,
      onSubmit: onSubmit,
      onFocus: onFocus,
      onBlur: onBlur,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

/// Internal view that maintains SecureField state
private struct SecureFieldView: View {
  let placeholder: String
  let initialValue: String
  let onTextChange: AttributeValue?
  let onSubmit: AttributeValue?
  let onFocus: AttributeValue?
  let onBlur: AttributeValue?
  let messageHandler: MessageHandler?

  @State private var text: String
  @FocusState private var isFocused: Bool

  init(
    placeholder: String,
    initialValue: String,
    onTextChange: AttributeValue?,
    onSubmit: AttributeValue?,
    onFocus: AttributeValue?,
    onBlur: AttributeValue?,
    messageHandler: MessageHandler?
  ) {
    self.placeholder = placeholder
    self.initialValue = initialValue
    self.onTextChange = onTextChange
    self.onSubmit = onSubmit
    self.onFocus = onFocus
    self.onBlur = onBlur
    self.messageHandler = messageHandler
    self._text = State(initialValue: initialValue)
  }

  var body: some View {
    SecureField(placeholder, text: $text)
      .focused($isFocused)
      .onChange(of: text) { oldValue, newValue in
        if let onTextChange = onTextChange, let messageHandler = messageHandler {
          let wrappedMessage = wrapMessage(onTextChange, addingToContext: [
            .text: AttributeValue(newValue),
            .oldText: AttributeValue(oldValue),
          ])
          messageHandler(wrappedMessage)
        }
      }
      .onChange(of: isFocused) { oldValue, newValue in
        // Trigger onFocus when focus is gained
        if !oldValue && newValue {
          if let onFocus = onFocus, let messageHandler = messageHandler {
            let wrappedMessage = wrapMessage(onFocus, addingToContext: [
              .text: AttributeValue(text),
            ])
            messageHandler(wrappedMessage)
          }
        }
        // Trigger onBlur when focus is lost
        if oldValue && !newValue {
          if let onBlur = onBlur, let messageHandler = messageHandler {
            let wrappedMessage = wrapMessage(onBlur, addingToContext: [
              .text: AttributeValue(text),
            ])
            messageHandler(wrappedMessage)
          }
        }
      }
      .onChange(of: initialValue) { _, newValue in
        // Sync with server value changes
        if newValue != text {
          text = newValue
        }
      }
      .onSubmit {
        if let onSubmit = onSubmit, let messageHandler = messageHandler {
          let wrappedMessage = wrapMessage(onSubmit, addingToContext: [
            .text: AttributeValue(text),
          ])
          messageHandler(wrappedMessage)
        }
      }
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20, alignment: .leading) {
      TextNode("Basic SecureField")
        .font(.headline)

      SecureFieldNode("Enter password")
        .onTextChange("passwordChanged")
        .onBlur("passwordBlurred")
        .padding(10)
        .background(ColorNode("#F0F0F0"))
        .cornerRadius(8)

      TextNode("SecureField with initial value")
        .font(.headline)

      SecureFieldNode("Password", value: "secret123")
        .padding(10)
        .background(ColorNode("#F0F0F0"))
        .cornerRadius(8)

      TextNode("SecureField with message handlers")
        .font(.headline)

      SecureFieldNode("Confirm password")
        .onTextChange(.dict([.action: "confirmPasswordChanged"]))
        .onSubmit(.dict([.action: "submitPassword"]))
        .onBlur(.dict([.action: "passwordBlurred"]))
        .padding(10)
        .background(ColorNode("#F0F0F0"))
        .cornerRadius(8)
    }
    .padding()
  }
  .messageHandler { message in
    print("Message:", message)
  }
}
