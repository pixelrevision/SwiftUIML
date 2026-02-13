import SwiftUI
import SwiftUIMLCore
public struct BrightnessModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .brightness
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let amount = value.cgFloat else {
      return nil
    }
    return view.brightness(amount)
  }
}

#Preview {
  DebugView(
    VStackNode(spacing: 4) {
      TextNode("Darkest")
        .foregroundColor("red")
        .font(size: 32)
        .brightness(-1)
      
      TextNode("Darker")
        .foregroundColor("red")
        .font(size: 32)
        .brightness(-0.5)
      
      TextNode("Normal")
        .foregroundColor("red")
        .font(size: 32)
        .brightness(0.0)
      
      TextNode("Brighter")
        .foregroundColor("red")
        .font(size: 32)
        .brightness(0.5)
      
      TextNode("Brightest")
        .foregroundColor("red")
        .font(size: 32)
        .brightness(1.0)
    }
  )
}
