import SwiftUI
import SwiftUIMLCore
public struct HiddenModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .hidden

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard value.bool == true else {
      return nil
    }
    return view.hidden()
  }
}

#Preview {
  DebugView {
    TextNode("Visible")
    
    TextNode("Hidden")
      .hidden()
    
    TextNode("Also Visible")
  }
}
