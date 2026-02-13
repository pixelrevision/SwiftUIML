import SwiftUI
import SwiftUIMLCore
public struct TabViewStyleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .tabViewStyle

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let styleString = value.string else {
      return nil
    }
    
    switch styleString {
    case "page":
      return view.tabViewStyle(.page)
    case "automatic":
      return view.tabViewStyle(.automatic)
    default:
      return nil
    }
  }
}

#Preview {
  DebugView {
    TabViewNode {
      ColorNode("#FF0000").frame(height: 200)
      ColorNode("#00FF00").frame(height: 200)
      ColorNode("#0000FF").frame(height: 200)
    }
    .tabViewStyle(.page)
  }
}
