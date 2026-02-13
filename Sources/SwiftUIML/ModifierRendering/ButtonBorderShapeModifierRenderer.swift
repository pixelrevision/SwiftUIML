import SwiftUI
import SwiftUIMLCore

public struct ButtonBorderShapeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .buttonBorderShape

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let shape = ButtonBorderShape(value) else {
      return nil
    }
    
    return view.buttonBorderShape(shape)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 12) {
      ButtonNode("Capsule", onTap: "tap")
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
      
      ButtonNode("Rounded", onTap: "tap")
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
    }
  }
}
