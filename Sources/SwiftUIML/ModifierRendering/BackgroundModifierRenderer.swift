import SwiftUI
import SwiftUIMLCore
public struct BackgroundModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .background

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    if let backgroundNode = value.node {
      // Simple background with default alignment (center)
      return view.background {
        NodeView(backgroundNode, messageHandler: messageHandler)
      }
    }
    else if let dict = value.dict, let backgroundNode = dict[.value]?.node {
      // Background with specified alignment
      let alignment = SwiftUI.Alignment(dict[.alignment]?.string)
      
      return view.background(alignment: alignment) {
        NodeView(backgroundNode, messageHandler: messageHandler)
      }
    }
    
    return nil
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
    .background(ColorNode("#0000FF33:#00FF0033"))
  }
}
