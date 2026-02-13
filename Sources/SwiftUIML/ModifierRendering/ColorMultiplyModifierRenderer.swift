import SwiftUI
import SwiftUIMLCore
public struct ColorMultiplyModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .colorMultiply
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let colorString = value.string else {
      return nil
    }
    let color = Color(colorString)
    return view.colorMultiply(color)
  }
}

#Preview {
  DebugView {
    LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
      .frame(width: 300, height: 150)
    
    LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
      .colorMultiply("red")
      .frame(width: 300, height: 150)
  }
}
