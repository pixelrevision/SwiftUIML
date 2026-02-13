import SwiftUI
import SwiftUIMLCore

public struct ToggleStyleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .toggleStyle

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let style = ToggleStyle(value) else {
      return nil
    }
    return view.toggleStyle(style)
  }
}

#Preview {
  DebugView {
    ToggleNode("Switch", isOn: true)
      .toggleStyle(.switch)
      .padding()

    ToggleNode("Button", isOn: true)
      .toggleStyle(.button)
      .padding()
  }
}
