import SwiftUI
import SwiftUIMLCore

public struct LineSpacingModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .lineSpacing

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let spacing = value.cgFloat else {
      return nil
    }
    return view.lineSpacing(spacing)
  }
}

#Preview {
  DebugView {
    TextNode("Line 1\nLine 2\nLine 3")
      .lineSpacing(30)
  }
}
