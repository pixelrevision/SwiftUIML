import SwiftUI
import SwiftUIMLCore
public struct ColorSchemeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .colorScheme

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let scheme = ColorScheme(value) else {
      return nil
    }
    return view.environment(\.colorScheme, scheme)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      VStackNode(spacing: 8) {
        TextNode("Light Mode")
          .font(.headline)
        ColorNode("#007AFF")
          .frame(width: 100, height: 100)
          .cornerRadius(8)
      }
      .colorScheme(.light)
      .padding()
      .backgroundColor("#F2F2F7")
      .cornerRadius(12)
      
      VStackNode(spacing: 8) {
        TextNode("Dark Mode")
          .font(.headline)
          .foregroundColor("#FFFFFF")
        ColorNode("#0A84FF")
          .frame(width: 100, height: 100)
          .cornerRadius(8)
      }
      .colorScheme(.dark)
      .padding()
      .backgroundColor("#1C1C1E")
      .cornerRadius(12)
    }
    .padding()
  }
}
