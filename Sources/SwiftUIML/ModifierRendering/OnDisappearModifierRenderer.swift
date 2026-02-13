import SwiftUI
import SwiftUIMLCore
public struct OnDisappearModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .onDisappear

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    return view.onDisappear {
      messageHandler?(value)
    }
  }
}

#Preview {
  DebugView {
    ColorNode("red")
      .frame(width: 100, height: 100)
      .onAppear("Disappeared")
  }
  .messageHandler { message in
    print("Message: \(message)")
  }
}
