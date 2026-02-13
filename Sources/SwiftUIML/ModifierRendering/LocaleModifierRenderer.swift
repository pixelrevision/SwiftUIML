import SwiftUI
import SwiftUIMLCore

public struct LocaleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .locale

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let localeIdentifier = value.string else {
      return nil
    }

    let locale = Locale(identifier: localeIdentifier)
    return view.environment(\.locale, locale)
  }
}
