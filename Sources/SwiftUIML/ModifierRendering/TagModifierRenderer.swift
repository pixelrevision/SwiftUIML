import SwiftUI
import SwiftUIMLCore
public struct TagModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .tag

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Tags can be strings or numbers
    if let tag = value.string {
      return view.tag(tag)
    }
    else if let tag = value.int {
      return view.tag(tag)
    }
    return nil
  }
}
