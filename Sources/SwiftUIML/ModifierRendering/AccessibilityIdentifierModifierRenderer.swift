import SwiftUI
import SwiftUIMLCore
public struct AccessibilityIdentifierModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilityIdentifier
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let identifier = value.string else {
      return nil
    }
    return AnyView(view).accessibilityIdentifier(identifier)
  }
}
