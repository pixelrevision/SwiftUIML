import SwiftUI
import SwiftUIMLCore

public struct TextFieldStyleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .textFieldStyle

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let style = TextFieldStyle(value) else {
      return nil
    }
    return view.textFieldStyle(style)
  }
}

#Preview {
  DebugView {
    TextFieldNode("Rounded Border")
      .textFieldStyle(.roundedBorder)
      .padding()
    
    TextFieldNode("Plain")
      .textFieldStyle(.plain)
      .padding()
  }
}
