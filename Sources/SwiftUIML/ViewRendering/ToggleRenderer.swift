import SwiftUI
import SwiftUIMLCore

public struct ToggleRenderer: ViewRenderer {
  public static let type: ViewType = .toggle

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let label = node.attributes[.label]?.string ?? ""
    let initialIsOn = node.attributes[.isOn]?.bool ?? false
    let onToggle = node.attributes[.onToggle]

    return ToggleView(
      label: label,
      initialIsOn: initialIsOn,
      onToggle: onToggle,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

/// Internal view that maintains Toggle state
private struct ToggleView: View {
  let label: String
  let initialIsOn: Bool
  let onToggle: AttributeValue?
  let messageHandler: MessageHandler?

  @State private var isOn: Bool

  init(
    label: String,
    initialIsOn: Bool,
    onToggle: AttributeValue?,
    messageHandler: MessageHandler?
  ) {
    self.label = label
    self.initialIsOn = initialIsOn
    self.onToggle = onToggle
    self.messageHandler = messageHandler
    self._isOn = State(initialValue: initialIsOn)
  }

  var body: some View {
    Toggle(label, isOn: $isOn)
      .onChange(of: isOn) { oldValue, newValue in
        if let onToggle = onToggle, let messageHandler = messageHandler {
          let wrappedMessage = wrapMessage(onToggle, addingToContext: [
            .isOn: AttributeValue(newValue),
            .oldValue: AttributeValue(oldValue),
          ])
          messageHandler(wrappedMessage)
        }
      }
      .onChange(of: initialIsOn) { _, newValue in
        // Sync with server value changes
        if newValue != isOn {
          isOn = newValue
        }
      }
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20, alignment: .leading) {
      ToggleNode("Enable notifications")
        .onToggle("notificationsToggled")

      ToggleNode("Dark mode", isOn: true)
        .onToggle(.dict([.action: "darkModeToggled"]))

      ToggleNode("Airplane mode")
        .onToggle(.dict([.action: "toggle", .id: "airplane"]))
    }
    .padding()
  }
  .messageHandler { message in
    print("Message:", message)
  }
}
