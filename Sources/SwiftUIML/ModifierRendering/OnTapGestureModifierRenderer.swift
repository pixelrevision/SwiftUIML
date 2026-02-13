import SwiftUI
import SwiftUIMLCore
public struct OnTapGestureModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .onTapGesture

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    return view.onTapGesture {
      messageHandler?(value)
    }
  }
}

#Preview {
  DebugView {
    ColorNode("red")
      .frame(width: 100, height: 100)
      .onTapGesture("Tapped")
  }
  .messageHandler { message in
    print("Message: \(message)")
  }
}
