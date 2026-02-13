import SwiftUI
import SwiftUIMLCore
public struct MultilineTextAlignmentModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .multilineTextAlignment

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let alignmentString = value.string else {
      return nil
    }
    
    let alignment = parseAlignment(alignmentString)
    return view.multilineTextAlignment(alignment)
  }
  
  private static func parseAlignment(_ string: String) -> TextAlignment {
    switch string.lowercased() {
    case "leading":
      return .leading
    case "center":
      return .center
    case "trailing":
      return .trailing
    default:
      return .leading
    }
  }
}

#Preview {
  DebugView {
    TextNode("Left\nAligned\nText With Additional Content")
      .multilineTextAlignment(.leading)

    DividerNode()

    TextNode("Center\nAligned\nText With Additional Content")
      .multilineTextAlignment(.center)

    DividerNode()
    
    TextNode("Trailing\nAligned\nText With Additional Content")
      .multilineTextAlignment(.trailing)
  }
}
