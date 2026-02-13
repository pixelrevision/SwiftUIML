import SwiftUI
import SwiftUIMLCore
public struct PaddingModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .padding

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    switch value {
    case .number(let amount):
      return view.padding(CGFloat(amount))
    case .dict(let dict):
      return view.padding(EdgeInsets(
        top: dict[.top]?.cgFloat ?? 0,
        leading: dict[.leading]?.cgFloat ?? 0,
        bottom: dict[.bottom]?.cgFloat ?? 0,
        trailing: dict[.trailing]?.cgFloat ?? 0
      ))
    default:
      return view.padding()
    }
  }
}

#Preview {
  DebugView {
    TextNode("Padded")
      .padding()
      .backgroundColor("#007AFF")
  }
}
