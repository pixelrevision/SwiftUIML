import SwiftUI
import SwiftUIMLCore
public struct OnLongPressGestureModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .onLongPressGesture

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    var message = value
    var minimumDuration: Double = 0.5

    if let dict = value.dict, let min = dict[.minimumDuration]?.double {
      // Extract message and duration from dictionary
      message = dict[.message] ?? value
      minimumDuration = min
    }
    return view.onLongPressGesture(minimumDuration: minimumDuration) {
      messageHandler?(message)
    }
  }
}

#Preview {
  DebugView {
    ColorNode("red")
      .frame(width: 100, height: 100)
      .onLongPressGesture("Long pressed", minimumDuration: 1)
  }
  .messageHandler { message in
    print("Message: \(message)")
  }
}
