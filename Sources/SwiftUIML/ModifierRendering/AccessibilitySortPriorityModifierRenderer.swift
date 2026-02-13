import SwiftUI
import SwiftUIMLCore

public struct AccessibilitySortPriorityModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilitySortPriority

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let priority = value.cgFloat else {
      return nil
    }
    return AnyView(view).accessibilitySortPriority(priority)
  }
}
