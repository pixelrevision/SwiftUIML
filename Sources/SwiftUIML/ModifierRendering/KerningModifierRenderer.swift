import SwiftUI
import SwiftUIMLCore

public struct KerningModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .kerning

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let kerning = value.cgFloat else {
      return nil
    }
    return view.kerning(kerning)
  }
}

#Preview {
  DebugView {
    TextNode("Normal Spacing")
    
    TextNode("Wide Spacing")
      .kerning(5)
  }
}
