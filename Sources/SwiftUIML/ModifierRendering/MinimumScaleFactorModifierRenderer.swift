import SwiftUI
import SwiftUIMLCore

public struct MinimumScaleFactorModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .minimumScaleFactor

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let factor = value.cgFloat else {
      return nil
    }
    return view.minimumScaleFactor(factor)
  }
}

#Preview {
  DebugView {
    TextNode("This text will scale down to fit")
      .minimumScaleFactor(0.5)
      .frame(width: 100, height: 20)
  }
}
