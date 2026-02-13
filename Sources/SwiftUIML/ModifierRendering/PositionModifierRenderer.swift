import SwiftUI
import SwiftUIMLCore

public struct PositionModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .position

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let dict = value.dict else {
      return nil
    }

    let x = dict[.x]?.cgFloat ?? 0
    let y = dict[.y]?.cgFloat ?? 0

    return view.position(x: x, y: y)
  }
}

#Preview {
  DebugView {
    ZStackNode {
      TextNode("Default Position")

      TextNode("Positioned")
        .position(x: 50, y: 50)
    }
  }
}
