import SwiftUI
import SwiftUIMLCore
public struct LineLimitModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .lineLimit

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let limit = value.int else {
      return nil
    }
    return view.lineLimit(limit)
  }
}

#Preview {
  DebugView {
    TextNode("This is a very long text that will be limited to two lines")
      .lineLimit(2)
      .frame(width: 150)
  }
}
