import SwiftUI
import SwiftUIMLCore
public struct FrameModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .frame

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard case .dict(let dict) = value else {
      return nil
    }
    // Check which frame modifier to use based on what keys are present
    let hasMinMax = dict.containsKey(
      .minWidth,
      .maxWidth,
      .minHeight,
      .maxHeight,
      .idealWidth,
      .idealHeight
    )
    if hasMinMax {
      return view.frame(
        minWidth: dict[.minWidth]?.cgFloat,
        idealWidth: dict[.width]?.cgFloat,
        maxWidth: dict[.maxWidth]?.cgFloat,
        minHeight: dict[.minHeight]?.cgFloat,
        idealHeight: dict[.height]?.cgFloat,
        maxHeight: dict[.maxHeight]?.cgFloat,
        alignment: .init(dict[.alignment]?.string)
      )
    }
    else {
      return view.frame(
        width: dict[.width]?.cgFloat,
        height: dict[.height]?.cgFloat,
        alignment: .init(dict[.alignment]?.string)
      )
    }
  }
}

#Preview {
  DebugView {
    ColorNode("#007AFF")
      .frame(width: 100, height: 50)
  }
}
