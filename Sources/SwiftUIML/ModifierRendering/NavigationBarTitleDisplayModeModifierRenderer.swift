import SwiftUI
import SwiftUIMLCore

public struct NavigationBarTitleDisplayModeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .navigationBarTitleDisplayMode

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let displayMode = NavigationBarItem.TitleDisplayMode(value) else {
      return nil
    }
    return view.navigationBarTitleDisplayMode(displayMode)
  }
}

#Preview {
  DebugView {
    NavigationStackNode {
      TextNode("Content")
        .navigationTitle("Inline Title")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}
