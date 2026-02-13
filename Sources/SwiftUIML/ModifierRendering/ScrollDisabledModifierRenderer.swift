import SwiftUI
import SwiftUIMLCore
public struct ScrollDisabledModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .scrollDisabled

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    let disabled = value.bool ?? false
    return view.scrollDisabled(disabled)
  }
}

#Preview {
  DebugView {
    ScrollViewNode {
      VStackNode(spacing: 8) {
        ForEachNode(1...20) { i in
          TextNode("Item \(i)")
        }
      }
    }
    .scrollDisabled(true)
    .frame(height: 100)
  }
}
