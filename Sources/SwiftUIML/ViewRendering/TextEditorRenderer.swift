import SwiftUI
import SwiftUIMLCore

public struct TextEditorRenderer: ViewRenderer {
  public static let type: ViewType = .textEditor

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let initialValue = node.attributes[.value]?.string ?? ""
    let onTextChange = node.attributes[.onTextChange]
    let onFocus = node.attributes[.onFocus]
    let onBlur = node.attributes[.onBlur]

    return TextEditorView(
      initialValue: initialValue,
      onTextChange: onTextChange,
      onFocus: onFocus,
      onBlur: onBlur,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

/// Internal view that maintains TextEditor state
private struct TextEditorView: View {
  let initialValue: String
  let onTextChange: AttributeValue?
  let onFocus: AttributeValue?
  let onBlur: AttributeValue?
  let messageHandler: MessageHandler?

  @State private var text: String
  @FocusState private var isFocused: Bool

  init(
    initialValue: String,
    onTextChange: AttributeValue?,
    onFocus: AttributeValue?,
    onBlur: AttributeValue?,
    messageHandler: MessageHandler?
  ) {
    self.initialValue = initialValue
    self.onTextChange = onTextChange
    self.onFocus = onFocus
    self.onBlur = onBlur
    self.messageHandler = messageHandler
    self._text = State(initialValue: initialValue)
  }

  var body: some View {
    TextEditor(text: $text)
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
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20, alignment: .leading) {
      TextNode("Basic TextEditor")
        .font(.headline)

      TextEditorNode()
        .onTextChange("textChanged")
        .onBlur("editorBlurred")
        .frame(height: 100)
        .padding(10)
        .background(ColorNode("#F0F0F0"))
        .cornerRadius(8)

      TextNode("TextEditor with initial value")
        .font(.headline)

      TextEditorNode(value: "This is some initial text.\nYou can edit this content.")
        .frame(height: 120)
        .padding(10)
        .background(ColorNode("#F0F0F0"))
        .cornerRadius(8)

      TextNode("TextEditor with message handlers")
        .font(.headline)

      TextEditorNode(value: "Type here...")
        .onTextChange(.dict([.action: "editorChanged"]))
        .onFocus(.dict([.action: "editorFocused"]))
        .onBlur(.dict([.action: "editorBlurred"]))
        .frame(height: 100)
        .padding(10)
        .background(ColorNode("#F0F0F0"))
        .cornerRadius(8)
    }
    .padding()
  }.messageHandler { message in
    print("Message:", message)
  }
}
