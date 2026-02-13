import SwiftUI
import SwiftUIMLCore

public struct KeyboardTypeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .keyboardType

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let keyboardType = UIKeyboardType(value) else {
      return nil
    }
    return view.keyboardType(keyboardType)
  }
}
