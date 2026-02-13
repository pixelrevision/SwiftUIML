import SwiftUI
import SwiftUIMLCore

public struct PrivacySensitiveModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .privacySensitive

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let sensitive = value.bool else {
      return nil
    }

    return view.privacySensitive(sensitive)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      // Normal text (visible in screenshots)
      TextNode("Public Information")
        .font(.title)

      // Privacy-sensitive text (hidden in screenshots)
      TextNode("Private: SSN 123-45-6789")
        .font(.title)
        .foregroundColor("#e74c3c")
        .privacySensitive()

      // Privacy-sensitive form field
      VStackNode(spacing: 8, alignment: .leading) {
        TextNode("Credit Card Number")
          .font(.caption)
        TextNode("4532 1234 5678 9010")
          .font(.body)
          .privacySensitive(true)
      }

      // Disabled privacy-sensitivity
      TextNode("Not Private Anymore")
        .privacySensitive(false)
    }
    .padding()
  }
}
