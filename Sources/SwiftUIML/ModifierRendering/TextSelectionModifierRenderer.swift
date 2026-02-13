import SwiftUI
import SwiftUIMLCore
public struct TextSelectionModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .textSelection

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    return value.string == "enabled" ? view.textSelection(.enabled) : view.textSelection(.disabled)
  }
}

#Preview {
  DebugView {
    TextNode("This text is selectable")
      .textSelection(.enabled)
      .padding()
  }
}
