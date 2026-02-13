import SwiftUI
import SwiftUIMLCore

public struct StrikethroughModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .strikethrough

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    var color: Color?
    var isActive: Bool = true

    if let boolValue = value.bool {
      isActive = boolValue
    }
    else if let dict = value.dict {
      isActive = dict[.isActive]?.bool ?? true
      if let col = dict[.color]?.string {
        color = Color(col)
      }
    }

    return view.strikethrough(isActive, color: color)
  }
}

#Preview {
  DebugView {
    TextNode("Striken Text")
      .strikethrough()
  }
}
