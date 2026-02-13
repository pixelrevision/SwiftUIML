import SwiftUI
import SwiftUIMLCore
public struct MaskModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .mask

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    if let maskNode = value.node {
      // Simple mask with default alignment (center)
      return view.mask {
        NodeView(maskNode, messageHandler: messageHandler)
      }
    }
    else if let dict = value.dict, let maskNode = dict[.value]?.node {
      // Mask with specified alignment
      let alignment = SwiftUI.Alignment(dict[.alignment]?.string)
      
      return view.mask(alignment: alignment) {
        NodeView(maskNode, messageHandler: messageHandler)
      }
    }
    
    return nil
  }
}

#Preview {
  DebugView {
    LinearGradientNode(
      colors: ["blue", "purple", "pink"],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
    .frame(width: 200, height: 200)
    .mask(
      ColorNode("#000000")
        .frame(width: 150, height: 150)
        .cornerRadius(75)
    )
  }
}
