import SwiftUI
import SwiftUIMLCore
public struct OffsetModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .offset
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Support both single number (applies to both x and y) and dict with x/y
    if let offsetValue = value.cgFloat {
      // Single value - offset both x and y
      return view.offset(x: offsetValue, y: offsetValue)
    }
    
    guard let dict = value.dict else {
      return nil
    }
    
    let x = dict[.x]?.cgFloat ?? 0
    let y = dict[.y]?.cgFloat ?? 0
    
    return view.offset(x: x, y: y)
  }
}

#Preview {
  DebugView {
    ZStackNode {
      TextNode("Baseline")

      TextNode("Offset")
        .offset(x: 25, y: 25)
    }
    .padding()
  }
}
