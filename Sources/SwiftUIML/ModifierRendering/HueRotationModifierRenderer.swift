import SwiftUI
import SwiftUIMLCore
public struct HueRotationModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .hueRotation
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let angle = Angle(value) else {
      return nil
    }
    return view.hueRotation(angle)
  }
}

#Preview {
  DebugView {
    LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
      .frame(width: 300, height: 150)
    
    LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
      .hueRotation(90)
      .frame(width: 300, height: 150)
    
    LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
      .hueRotation(180)
      .frame(width: 300, height: 150)
    
    LinearGradientNode(colors: ["#FF6B6B", "#4ECDC4", "#45B7D1"])
      .hueRotation(270)
      .frame(width: 300, height: 150)
  }
}
