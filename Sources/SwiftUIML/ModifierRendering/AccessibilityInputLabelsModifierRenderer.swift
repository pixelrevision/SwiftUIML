import SwiftUI
import SwiftUIMLCore

public struct AccessibilityInputLabelsModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .accessibilityInputLabels

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let labelsArray = value.array else {
      return nil
    }

    let labels = labelsArray.compactMap { $0.string }
    guard !labels.isEmpty else {
      return nil
    }

    return AnyView(view).accessibilityInputLabels(labels)
  }
}
