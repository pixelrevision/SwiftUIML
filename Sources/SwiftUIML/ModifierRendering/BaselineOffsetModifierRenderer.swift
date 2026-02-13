import SwiftUI
import SwiftUIMLCore

public struct BaselineOffsetModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .baselineOffset

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let offset = value.cgFloat else {
      return nil
    }
    return view.baselineOffset(offset)
  }
}

#Preview {
  DebugView {
    HStackNode {
      TextNode("Normal")
      TextNode("Raised").baselineOffset(10)
      TextNode("Lowered").baselineOffset(-10)
    }
  }
}
