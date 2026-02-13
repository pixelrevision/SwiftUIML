import SwiftUI
import SwiftUIMLCore
public struct OnAppearModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .onAppear

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    return view.onAppear {
      messageHandler?(value)
    }
  }
}

#Preview {
  DebugView {
    ColorNode("red")
      .frame(width: 100, height: 100)
      .onAppear("Appeared")
  }
  .messageHandler { message in
    print("Message: \(message)")
  }
}
