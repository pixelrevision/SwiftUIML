import SwiftUI
import SwiftUIMLCore
public struct SaturationModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .saturation
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let amount = value.cgFloat else {
      return nil
    }
    return view.saturation(amount)
  }
}

#Preview {
  DebugView(
    VStackNode(spacing: 20) {
      LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
        .frame(width: 300, height: 150)
      
      LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
        .saturation(2.0)
        .frame(width: 300, height: 150)
      
      LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
        .saturation(10.0)
        .frame(width: 300, height: 150)
    }
    .padding()
  )
}
