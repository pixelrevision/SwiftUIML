import SwiftUI
import SwiftUIMLCore

public struct AccessibilityActionModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilityAction

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let dict = value.dict,
      let actionName = dict[.name]?.string,
      let message = dict[.message],
      let handler = messageHandler
    else {
      return nil
    }
    return AnyView(view).accessibilityAction(named: Text(actionName)) {
      handler(message)
    }
  }
}
