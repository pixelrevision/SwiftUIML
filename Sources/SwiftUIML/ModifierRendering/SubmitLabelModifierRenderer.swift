import SwiftUI
import SwiftUIMLCore

public struct SubmitLabelModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .submitLabel

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let submitLabel = SubmitLabel(value) else {
      return nil
    }
    return view.submitLabel(submitLabel)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 12) {
      TextNode("Submit Label Examples")
        .font(.headline)

      TextFieldNode("Search...", value: "")
        .submitLabel(.search)
        .textFieldStyle(.roundedBorder)
        .padding()

      TextFieldNode("Send message", value: "")
        .submitLabel(.send)
        .textFieldStyle(.roundedBorder)
        .padding()

      TextFieldNode("Continue", value: "")
        .submitLabel(.continue)
        .textFieldStyle(.roundedBorder)
        .padding()

      TextFieldNode("Done", value: "")
        .submitLabel(.done)
        .textFieldStyle(.roundedBorder)
        .padding()
    }
  }
}
