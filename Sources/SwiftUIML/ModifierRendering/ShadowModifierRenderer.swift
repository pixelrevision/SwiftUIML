import SwiftUI
import SwiftUIMLCore
public struct ShadowModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .shadow

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let dict = value.dict,
      let colorAttr = dict[.color],
      let color = Color(colorAttr)
    else {
      return nil
    }
    return view.shadow(
      color: color,
      radius: dict[.radius]?.cgFloat ?? 5,
      x: dict[.x]?.cgFloat ?? 0,
      y: dict[.y]?.cgFloat ?? 0
    )
  }
}

#Preview {
  DebugView {
    TextNode("Shadow")
      .font(size: 24, weight: .bold)
      .shadow(color: "#00000040:#FFFFFF", radius: 4, x: 0, y: 2)
  }
}
