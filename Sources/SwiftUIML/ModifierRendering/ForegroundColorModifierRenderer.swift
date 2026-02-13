import SwiftUI
import SwiftUIMLCore
public struct ForegroundColorModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .foregroundColor

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let color = Color(value) else {
      return nil
    }
    return view.foregroundColor(color)
  }
}

#Preview {
  DebugView {
    TextNode("Red")
      .foregroundColor("#FF0000")
    
    TextNode("Blue")
      .foregroundColor("#0000FF")
  }
}
