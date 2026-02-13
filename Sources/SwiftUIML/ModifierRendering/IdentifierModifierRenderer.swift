import SwiftUI
import SwiftUIMLCore

public struct IdentifierModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .id

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let identifier = value.string else {
      return nil
    }
    return view.id(identifier)
  }
}
