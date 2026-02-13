import SwiftUI
import SwiftUIMLCore

public struct AccessibilityElementModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilityElement

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let behavior = AccessibilityChildBehavior(value) else {
      return nil
    }

    return AnyView(view).accessibilityElement(children: behavior)
  }
}
