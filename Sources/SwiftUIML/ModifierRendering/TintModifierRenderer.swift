import SwiftUI
import SwiftUIMLCore
public struct TintModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .tint
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let color = Color(value) else {
      return nil
    }
    return view.tint(color)
  }
}

#Preview {
  DebugView(
    ButtonNode("Tap", onTap: "tap")
      .tint("#FF0000")
      .padding()
  )
}
