import SwiftUI
import SwiftUIMLCore
public struct AccessibilityLabelModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilityLabel
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let label = value.string else {
      return nil
    }
    return AnyView(view).accessibilityLabel(label)
  }
}
