import SwiftUI
import SwiftUIMLCore
public struct FixedSizeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .fixedSize

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Accept either a bool (both axes) or a dictionary with horizontal/vertical
    if let enabled = value.bool, enabled {
      // .fixedSize() - both axes
      return view.fixedSize()
    }
    else if let dict = value.dict {
      let horizontal = dict[.horizontal]?.bool ?? true
      let vertical = dict[.vertical]?.bool ?? true
      
      return view.fixedSize(horizontal: horizontal, vertical: vertical)
    }
    
    return nil
  }
}

#Preview {
  DebugView {
    TextNode("This text will not wrap")
      .fixedSize()
      .frame(width: 100)
      .backgroundColor("#0000FF33")
  }
}
