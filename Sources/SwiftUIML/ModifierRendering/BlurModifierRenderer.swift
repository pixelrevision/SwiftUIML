import SwiftUI
import SwiftUIMLCore
public struct BlurModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .blur
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Accept either a number (radius) or a dictionary with radius and optional opaque
    if let radius = value.cgFloat {
      return view.blur(radius: radius)
    }
    else if let dict = value.dict {
      let radius = dict[.radius]?.cgFloat ?? 0
      let opaque = dict[.opaque]?.bool ?? false
      return view.blur(radius: radius, opaque: opaque)
    }
    
    return nil
  }
}

#Preview {
  DebugView(
    VStackNode(spacing: 4) {
      TextNode("Sharp")
        .font(size: 32)
      TextNode("Blurred")
        .font(size: 32)
        .blur(3)
    }
  )
}
