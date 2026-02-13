import SwiftUI
import SwiftUIMLCore
public struct ClippedModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .clipped

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard value.bool == true else {
      return nil
    }
    return view.clipped()
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      TextNode("Without Clipped:")
      CircleNode()
        .fill("#007AFF")
        .frame(width: 100, height: 100)
        .frame(width: 60, height: 60)
        .padding(10)

      DividerNode()

      TextNode("With Clipped:")
        .padding(10)
      CircleNode()
        .fill("#FF0000")
        .frame(width: 100, height: 100)
        .frame(width: 60, height: 60)
        .clipped()
        .padding(10)
    }
  }
}
