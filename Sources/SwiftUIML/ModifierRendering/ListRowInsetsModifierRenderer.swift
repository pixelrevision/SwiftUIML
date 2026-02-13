import SwiftUI
import SwiftUIMLCore

public struct ListRowInsetsModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .listRowInsets

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let dict = value.dict else {
      return nil
    }
    let insets = EdgeInsets(
      top: dict[.top]?.cgFloat ?? 0,
      leading: dict[.leading]?.cgFloat ?? 0,
      bottom: dict[.bottom]?.cgFloat ?? 0,
      trailing: dict[.trailing]?.cgFloat ?? 0
    )
    return view.listRowInsets(insets)
  }
}

#Preview {
  DebugView {
    ListNode {
      TextNode("Default Insets")
        .listRowBackground(ColorNode("#E8E8E8"))
      
      TextNode("Custom Insets (40 leading, 20 top/bottom)")
        .listRowBackground(ColorNode("#D0D0D0"))
        .listRowInsets(top: 20, leading: 40, bottom: 20, trailing: 40)
      
      TextNode("Zero Insets")
        .listRowBackground(ColorNode("#B8B8B8"))
        .listRowInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
      
      TextNode("Large Insets (60 all sides)")
        .listRowBackground(ColorNode("#A0A0A0"))
        .listRowInsets(top: 60, leading: 60, bottom: 60, trailing: 60)
    }
    .frame(width: 350, height: 400)
  }
}
