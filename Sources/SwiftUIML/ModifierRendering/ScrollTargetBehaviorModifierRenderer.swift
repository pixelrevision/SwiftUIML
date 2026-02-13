import SwiftUI
import SwiftUIMLCore
public struct ScrollTargetBehaviorModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .scrollTargetBehavior

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let behaviorString = value.string else {
      return nil
    }
    
    switch behaviorString {
    case "paging":
      return view.scrollTargetBehavior(.paging)
    case "viewAligned":
      return view.scrollTargetBehavior(.viewAligned)
    default:
      return nil
    }
  }
}

#Preview {
  DebugView {
    ScrollViewNode(axis: .horizontal) {
      HStackNode(spacing: 8) {
        ForEachNode(1...20) { _ in
          ColorNode("red")
            .frame(width: 100, height: 100)
        }
      }
    }
    .scrollTargetBehavior(.paging)
    .frame(height: 100)
    .padding()
  }
}
