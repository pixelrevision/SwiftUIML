import SwiftUI
import SwiftUIMLCore

public struct ProgressViewStyleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .progressViewStyle

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let style = ProgressViewStyle(value) else {
      return nil
    }
    return view.progressViewStyle(style)
  }
}

#Preview {
  DebugView {
    ProgressViewNode(label: "Loading", value: 0.6)
      .progressViewStyle(.linear)
      .padding()

    ProgressViewNode(label: "Loading", value: 0.6)
      .progressViewStyle(.circular)
      .padding()
  }
}
