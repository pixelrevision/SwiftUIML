import SwiftUI
import SwiftUIMLCore

public struct AllowsTighteningModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .allowsTightening

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let allows = value.bool else {
      return nil
    }
    return view.allowsTightening(allows)
  }
}

#Preview {
  DebugView {
    TextNode("With Tightening")
      .font(.headline)
    TextNode("This is a long text that needs to fit")
      .allowsTightening(true)
      .frame(width: 200, height: 25)

    DividerNode()

    TextNode("Without Tightening")
      .font(.headline)
    TextNode("This is a long text that needs to fit")
      .frame(width: 200, height: 25)
  }
}
