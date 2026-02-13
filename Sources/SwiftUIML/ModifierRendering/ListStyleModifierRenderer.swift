import SwiftUI
import SwiftUIMLCore

public struct ListStyleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .listStyle

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let style = ListStyle(value) else {
      return nil
    }
    return view.listStyle(style)
  }
}

#Preview {
  DebugView {
    ListNode {
      TextNode("Item 1")
      TextNode("Item 2")
      TextNode("Item 3")
    }
    .listStyle(.insetGrouped)

    ListNode {
      TextNode("Item 1")
      TextNode("Item 2")
      TextNode("Item 3")
    }
    .listStyle(.plain)
  }
}
