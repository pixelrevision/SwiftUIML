import SwiftUI
import SwiftUIMLCore

public struct SafeAreaInsetModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .safeAreaInset

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let dict = value.dict,
      let edgeValue = dict[.edge],
      let edge = VerticalEdge(edgeValue),
      let contentNode = dict[.content]?.node
    else {
      return nil
    }
    let alignment = HorizontalAlignment(dict[.alignment]?.string ?? "center")
    let spacing = dict[.spacing]?.cgFloat
    let contentView = NodeView(contentNode, messageHandler: messageHandler)
    if let spacing = spacing {
      return view.safeAreaInset(edge: edge, alignment: alignment, spacing: spacing) {
        contentView
      }
    }
    else {
      return view.safeAreaInset(edge: edge, alignment: alignment) {
        contentView
      }
    }
  }
}

#Preview {
  DebugView {
    ColorNode("#007AFF")
      .safeAreaInset(
        edge: .top,
        content: TextNode("Top Inset")
          .padding()
          .backgroundColor("#FF9500")
      )
      .safeAreaInset(
        edge: .bottom,
        content: TextNode("Bottom Inset")
          .padding()
          .backgroundColor("#FF9500")
      )
  }
}
