import SwiftUI
import SwiftUIMLCore
public struct ColorInvertModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .colorInvert
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard value.bool == true else {
      return nil
    }
    return view.colorInvert()
  }
}

#Preview {
  DebugView {
    LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
      .frame(width: 300, height: 150)
    LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
      .colorInvert()
      .frame(width: 300, height: 150)
  }
}
