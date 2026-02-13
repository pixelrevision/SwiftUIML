import SwiftUI
import SwiftUIMLCore

public struct ControlSizeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .controlSize

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let size = ControlSize(value) else {
      return nil
    }
    return view.controlSize(size)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 12) {
      ButtonNode("Small", onTap: "tap")
        .controlSize(.small)
      
      ButtonNode("Regular", onTap: "tap")
        .controlSize(.regular)
      
      ButtonNode("Large", onTap: "tap")
        .controlSize(.large)
    }
  }
}
