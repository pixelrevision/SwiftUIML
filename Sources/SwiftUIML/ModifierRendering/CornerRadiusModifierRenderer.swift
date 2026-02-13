import SwiftUI
import SwiftUIMLCore
public struct CornerRadiusModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .cornerRadius

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let radius = value.cgFloat else {
      return nil
    }
    return view.cornerRadius(max(radius, 0.0))
  }
}

#Preview {
  DebugView {
    ColorNode("#007AFF")
      .frame(width: 100, height: 100)
      .cornerRadius(20)
  }
}
