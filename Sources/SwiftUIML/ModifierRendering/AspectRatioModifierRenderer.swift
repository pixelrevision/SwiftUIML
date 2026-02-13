import SwiftUI
import SwiftUIMLCore
public struct AspectRatioModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .aspectRatio

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    if let ratio = parseRatio(value) {
      return view.aspectRatio(ratio, contentMode: .fit)
    }
    else if let dict = value.dict, let ratio = dict[.ratio] {
      // Dict format with ratio and optional contentMode
      guard let ratio = parseRatio(ratio)else {
        return nil
      }
      let contentMode = ContentMode(dict[.contentMode]?.string)
      return view.aspectRatio(ratio, contentMode: contentMode)
    }
    return nil
  }

  private static func parseRatio(_ attr: AttributeValue) -> CGFloat? {
    if let value = attr.cgFloat {
      return value
    }
    if let value = attr.string?.split(separator: ":").compactMap({ Double($0) }), value.count == 2 {
      return CGFloat(value[0])/CGFloat(value[1])
    }
    return nil
  }
}

#Preview {
  DebugView {
    ColorNode("#FF0000")
      .aspectRatio(16/9, contentMode: .fit)
      .padding()
  }
}
