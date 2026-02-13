import SwiftUI
import SwiftUIMLCore
public struct ItalicModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .italic

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    return value.bool == true ? view.italic() : nil
  }
}

#Preview {
  DebugView {
    TextNode("Italic Text")
      .italic()
  }
}
