import SwiftUI
import SwiftUIMLCore

public struct TrackingModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .tracking

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let tracking = value.cgFloat else {
      return nil
    }
    return view.tracking(tracking)
  }
}

#Preview {
  DebugView {
    TextNode("Normal Tracking")
      .padding()
    
    TextNode("Wide Tracking")
      .tracking(5)
      .padding()
  }
}
