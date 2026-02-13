import SwiftUI
import SwiftUIMLCore

public struct NavigationBarHiddenModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .navigationBarHidden

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    return view.navigationBarHidden(value.bool ?? false)
  }
}

#Preview {
  DebugView {
    NavigationStackNode {
      TextNode("Content")
        .navigationTitle("Hidden Nav")
        .navigationBarHidden(true)
    }
  }
}
