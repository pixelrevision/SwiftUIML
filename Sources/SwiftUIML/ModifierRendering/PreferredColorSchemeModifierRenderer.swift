import SwiftUI
import SwiftUIMLCore

public struct PreferredColorSchemeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .preferredColorScheme

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let scheme = ColorScheme(value) else {
      return nil
    }
    return view.preferredColorScheme(scheme)
  }
}
