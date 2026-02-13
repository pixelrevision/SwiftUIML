import SwiftUI
import SwiftUIMLCore
public struct ScrollTargetLayoutModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .scrollTargetLayout

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // scrollTargetLayout() doesn't take parameters, just needs to be applied
    // Accept bool true or any truthy value
    if value.bool == true || value.string != nil {
      return view.scrollTargetLayout()
    }
    return nil
  }
}

#Preview {
  DebugView {
    ScrollViewNode(axis: .horizontal) {
      HStackNode(spacing: 8) {
        ForEachNode(1...20) { i in
          ColorNode(i % 2 == 0 ? "#FF6B35" : "#004E89")
            .frame(width: 100, height: 100)
            .cornerRadius(8)
        }
      }
      .scrollTargetLayout()
    }
    .scrollTargetBehavior(.viewAligned)
    .frame(height: 100)
    .padding()
  }
}
