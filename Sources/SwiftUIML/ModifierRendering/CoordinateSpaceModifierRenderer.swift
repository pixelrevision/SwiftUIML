import SwiftUI
import SwiftUIMLCore

public struct CoordinateSpaceModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .coordinateSpace

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let name = value.string else {
      return nil
    }
    return view.coordinateSpace(name: name)
  }
}
