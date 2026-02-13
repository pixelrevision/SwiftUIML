import SwiftUI
import SwiftUIMLCore

public struct TruncationModeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .truncationMode

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let truncationMode = Text.TruncationMode(value) else {
      return nil
    }
    return view.truncationMode(truncationMode)
  }
}

#Preview {
  DebugView {
    TextNode("This is a very long text that will be truncated")
      .truncationMode(.tail)
      .frame(width: 150, height: 40)

    TextNode("This is a very long text that will be truncated")
      .truncationMode(.head)
      .frame(width: 150, height: 40)

    TextNode("This is a very long text that will be truncated")
      .truncationMode(.middle)
      .frame(width: 150, height: 40)
  }
}
