import SwiftUI
import SwiftUIMLCore

public struct BlendModeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .blendMode

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let modeString = value.string,
      let blendMode = SwiftUI.BlendMode(modeString)
    else {
      return nil
    }
    return view.blendMode(blendMode)
  }
}

#Preview {
  DebugView {
    SpacerNode()
    ZStackNode {
      ColorNode("#FF0000")
        .frame(width: 200, height: 200)
        .offset(x: -50, y: -50)

      ColorNode("#00FF00")
        .frame(width: 200, height: 200)
        .offset(x: 50, y: 50)
        .blendMode(.darken)
    }
    SpacerNode()
  }
}
