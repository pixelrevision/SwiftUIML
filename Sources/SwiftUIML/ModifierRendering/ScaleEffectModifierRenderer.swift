import SwiftUI
import SwiftUIMLCore

public struct ScaleEffectModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .scaleEffect

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Support both single number (uniform scale) and dict with x/y/anchor
    if let scale = value.cgFloat {
      // Single value - uniform scale
      return view.scaleEffect(scale)
    }

    guard let dict = value.dict else {
      return nil
    }
    let x = dict[.x]?.cgFloat ?? 1
    let y = dict[.y]?.cgFloat ?? 1
    let anchor = UnitPoint(dict[.anchor]?.string ?? "") ?? .center
    return view.scaleEffect(x: x, y: y, anchor: anchor)
  }
}

#Preview {
  DebugView {
    TextNode("Hello, World!")
      .scaleEffect(x: 3, y: 1)
      .padding()
  }
}
