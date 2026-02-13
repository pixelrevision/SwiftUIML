import SwiftUI
import SwiftUIMLCore
public struct OpacityModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .opacity

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let opacity = value.cgFloat else {
      return nil
    }
    return view.opacity(min(max(opacity, 0.0), 1.0))
  }
}

#Preview {
  DebugView {
    TextNode("Full")
      .opacity(1.0)
    
    TextNode("Half")
      .opacity(0.5)
    
    TextNode("Faint")
      .opacity(0.2)
  }
}
