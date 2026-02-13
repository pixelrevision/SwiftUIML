import SwiftUI
import SwiftUIMLCore

public struct UnderlineModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .underline

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
    return view.underline(isActive, color: color)
  }
}

#Preview {
  DebugView {
    TextNode("Underlined")
      .underline(true)
      .padding()
    
    TextNode("Red Underline")
      .underline(true, color: "#FF0000")
      .padding()
  }
}
