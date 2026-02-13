import SwiftUI
import SwiftUIMLCore

public struct BadgeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .badge

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    if let label = value.string {
      return view.badge(label)
    }
    else if let count = value.int {
      return view.badge(count)
    }
    return nil
  }
}

#Preview {
  DebugView {
    ListNode {
      TextNode("Inbox")
        .badge("99+")
      
      TextNode("Drafts")
        .badge(5)
    }
  }
}
