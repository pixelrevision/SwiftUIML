import SwiftUI
import SwiftUIMLCore
public struct AccessibilityValueModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilityValue
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let valueStr = value.string else { return nil }
    return AnyView(view).accessibilityValue(valueStr)
  }
}
