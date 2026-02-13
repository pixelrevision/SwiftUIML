import SwiftUI
import SwiftUIMLCore
public struct GrayscaleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .grayscale
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let amount = value.cgFloat else {
      return nil
    }
    return view.grayscale(amount)
  }
}

#Preview {
  DebugView(
    VStackNode(spacing: 20) {
      LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
        .frame(width: 300, height: 150)
      
      LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
        .grayscale(0.5)
        .frame(width: 300, height: 150)
      
      LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
        .grayscale(1.0)
        .frame(width: 300, height: 150)
    }
    .padding()
  )
}
