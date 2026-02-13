import SwiftUI
import SwiftUIMLCore

public struct TimeZoneModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .timeZone

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let timeZoneIdentifier = value.string,
      let timeZone = TimeZone(identifier: timeZoneIdentifier)
    else {
      return nil
    }
    return view.environment(\.timeZone, timeZone)
  }
}
