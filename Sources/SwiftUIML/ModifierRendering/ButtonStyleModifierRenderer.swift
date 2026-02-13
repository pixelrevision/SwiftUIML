import SwiftUI
import SwiftUIMLCore

public struct ButtonStyleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .buttonStyle

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let style = ButtonStyle(value) else {
      return nil
    }
    return view.buttonStyle(style)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 12) {
      ButtonNode("Plain", onTap: "tap")
        .buttonStyle(.plain)
      
      ButtonNode("Bordered", onTap: "tap")
        .buttonStyle(.bordered)
      
      ButtonNode("Borderless", onTap: "tap")
        .buttonStyle(.borderless)
    }
  }
}
