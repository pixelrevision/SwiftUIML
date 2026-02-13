import SwiftUI
import SwiftUIMLCore

public struct ListRowBackgroundModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .listRowBackground

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let backgroundNode = value.node else {
      return nil
    }
    return view.listRowBackground(NodeView(backgroundNode, messageHandler: messageHandler))
  }
}

#Preview {
  DebugView {
    ListNode {
      TextNode("Row 1")
        .listRowBackground(ColorNode("#FF0000"))
      
      TextNode("Row 2")
        .listRowBackground(ColorNode("#00FF00"))
      
      TextNode("Row 3")
        .listRowBackground(ColorNode("#0000FF"))
    }
    .listStyle(.insetGrouped)
    .frame(width: 300, height: 250)
  }
}
