import SwiftUI
import SwiftUIMLCore

public struct RedactedModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .redacted

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let reasonString = value.string,
      let reason = RedactionReasons(reasonString)
    else {
      return nil
    }
    return view.redacted(reason: reason)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      // Normal text
      TextNode("Normal Text")
        .font(.headline)

      // Placeholder redacted (loading state)
      TextNode("Loading Placeholder")
        .font(.headline)
        .redacted(reason: .placeholder)

      // Privacy redacted
      TextNode("Private Information")
        .font(.headline)
        .redacted(reason: .privacy)

      // Redacted list item example
      HStackNode(spacing: 10) {
        CircleNode()
          .fill("#3498db")
          .frame(width: 50, height: 50)
          .redacted(reason: .placeholder)
        VStackNode(alignment: .leading) {
          TextNode("User Name")
            .font(.headline)
          TextNode("user@example.com")
            .font(.caption)
        }
        .redacted(reason: .placeholder)
      }
    }
    .padding()
  }
}
