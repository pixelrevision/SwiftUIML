import SwiftUI
import SwiftUIMLCore
public struct BorderModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .border

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let dict = value.dict,
      let width = dict[.width]?.cgFloat,
      let colorAttr = dict[.color],
      let color = Color(colorAttr)
    else {
      return nil
    }
    return view.border(color, width: width)
  }
}

#Preview {
  DebugView {
    TextNode("Bordered")
      .padding()
      .border("#007AFF", width: 2)
  }
}
