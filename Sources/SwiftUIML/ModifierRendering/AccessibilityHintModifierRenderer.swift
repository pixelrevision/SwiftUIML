import SwiftUI
import SwiftUIMLCore
public struct AccessibilityHintModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilityHint
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let hint = value.string else {
      return nil
    }
    return AnyView(view).accessibilityHint(hint)
  }
}
