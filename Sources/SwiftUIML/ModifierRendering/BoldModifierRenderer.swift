import SwiftUI
import SwiftUIMLCore
public struct BoldModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .bold

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    return value.bool == true ? view.bold() : nil
  }
}

#Preview {
  DebugView {
    TextNode("Bold Text")
      .bold()
  }
}
