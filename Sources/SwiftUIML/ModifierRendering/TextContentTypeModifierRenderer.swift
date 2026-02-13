import SwiftUI
import SwiftUIMLCore

public struct TextContentTypeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .textContentType

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let textContentType = UITextContentType(value) else {
      return nil
    }
    return view.textContentType(textContentType)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 12) {
      TextNode("Text Content Type Examples")
        .font(.headline)

      TextNode("Enables AutoFill suggestions")
        .font(.caption)
        .foregroundColor("#888888")

      TextFieldNode("Username", value: "")
        .textContentType(.username)
        .textFieldStyle(.roundedBorder)

      TextFieldNode("Email", value: "")
        .textContentType(.emailAddress)
        .keyboardType(.emailAddress)
        .textFieldStyle(.roundedBorder)

      SecureFieldNode("Password", value: "")
        .textContentType(.password)
        .textFieldStyle(.roundedBorder)

      TextFieldNode("Phone", value: "")
        .textContentType(.telephoneNumber)
        .keyboardType(.phonePad)
        .textFieldStyle(.roundedBorder)

      TextFieldNode("Street Address", value: "")
        .textContentType(.fullStreetAddress)
        .textFieldStyle(.roundedBorder)

      TextFieldNode("City", value: "")
        .textContentType(.addressCity)
        .textFieldStyle(.roundedBorder)
    }
    .padding()
  }
}
