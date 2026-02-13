import SwiftUI
import SwiftUIMLCore
public struct RenderingModeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .renderingMode

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let image = view as? Image else {
      return nil
    }
    return image
      .renderingMode(.init(value))
  }
}

#Preview {
  DebugView {
    ImageNode(systemName: "star.fill")
      .resizable()
      .renderingMode(.template)
      .foregroundColor("#FF0000")
      .frame(width: 100, height: 100)
  }
}
