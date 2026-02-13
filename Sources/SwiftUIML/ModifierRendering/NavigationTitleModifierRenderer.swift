import SwiftUI
import SwiftUIMLCore

public struct NavigationTitleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .navigationTitle

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let title = value.string else {
      return nil
    }
    return view.navigationTitle(title)
  }
}

#Preview {
  DebugView {
    NavigationStackNode {
      TextNode("Content")
        .navigationTitle("My Title")
    }
  }
}
