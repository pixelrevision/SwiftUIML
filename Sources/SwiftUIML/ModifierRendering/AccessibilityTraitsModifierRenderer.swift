import SwiftUI
import SwiftUIMLCore
public struct AccessibilityTraitsModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilityTraits
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    if let trait = value.string, let trait = AccessibilityTraits(trait) {
      return AnyView(view).accessibilityAddTraits(trait)
    }
    if let traits = value.array {
      let parsed = traits
        .compactMap { $0.string }
        .compactMap { AccessibilityTraits($0) }
        .reduce(into: AccessibilityTraits()) { _ = $0.insert($1) }
      return AnyView(view).accessibilityAddTraits(parsed)
    }
    return nil
  }
}
