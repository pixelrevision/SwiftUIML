import SwiftUI
import SwiftUIMLCore
public struct BackgroundColorModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .backgroundColor

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let color = Color(value) else {
      return nil
    }
    return view.background(color)
  }
}

#Preview {
  DebugView {
    VStackNode {
      TextNode("Card Title")
        .font(.headline)
      TextNode("Some content here")
        .font(.body)
    }
    .padding(16)
    .backgroundColor("#0000FF33:#00FF0033")
  }
}
