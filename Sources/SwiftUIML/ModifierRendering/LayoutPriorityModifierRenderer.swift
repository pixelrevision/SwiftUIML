import SwiftUI
import SwiftUIMLCore

public struct LayoutPriorityModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .layoutPriority

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let priority = value.cgFloat else {
      return nil
    }
    return view.layoutPriority(priority)
  }
}

#Preview {
  DebugView {
    HStackNode {
      TextNode("This is a moderately long string.")
        .font(.largeTitle)
        // needed so that this it's applied correctly
        .ignoreEquatable()
        .border("#000000", width: 1)

      SpacerNode()

      TextNode("This is a higher priority string.")
        .layoutPriority(1)
        .font(.largeTitle)
        // needed so that this it's applied correctly
        .ignoreEquatable()
        .border("#000000", width: 1)
    }
    .frame(height: 100)
    .padding()
  }
}
