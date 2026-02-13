import SwiftUI
import SwiftUIMLCore
public struct OverlayModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .overlay

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    if let overlayNode = value.node {
      return view.overlay {
        NodeView(overlayNode, messageHandler: messageHandler)
      }
    }
    else if let dict = value.dict, let overlayNode = dict[.value]?.node {
      let alignment = Alignment(dict[.alignment]?.string)
      return view.overlay(alignment: alignment) {
        NodeView(overlayNode, messageHandler: messageHandler)
      }
    }
    return nil
  }
}

#Preview {
  DebugView {
    ImageNode(systemName: "photo")
      .font(size: 120)
      .foregroundColor("#007AFF")
      .overlay(
        TextNode("NEW")
          .font(.caption)
          .bold()
          .foregroundColor("#FFFFFF")
          .padding(8)
          .backgroundColor("#FF3B30")
          .cornerRadius(8),
        alignment: .topLeading
      )
      .padding()
  }
}
