import SwiftUI
import SwiftUIMLCore
public struct AccessibilityHiddenModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilityHidden
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let isHidden = value.bool else {
      return nil
    }
    return AnyView(view).accessibilityHidden(isHidden)
  }
}
