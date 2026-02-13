import SwiftUI
import SwiftUIMLCore
public struct ResizableModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .resizable

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let image = view as? Image, value.bool == true else {
      return nil
    }
    return image.resizable()
  }
}

#Preview {
  DebugView {
    TextNode("Baseline")
    ImageNode(systemName: "star.fill")
      .frame(width: 50, height: 50)
      .backgroundColor("#0000FF33")

    DividerNode()

    TextNode("Resizable")
    ImageNode(systemName: "star.fill")
      .resizable()
      .frame(width: 50, height: 50)
      .backgroundColor("#0000FF33")
  }
}
