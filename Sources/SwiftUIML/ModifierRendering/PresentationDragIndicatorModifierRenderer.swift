import SwiftUI
import SwiftUIMLCore

public struct PresentationDragIndicatorModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .presentationDragIndicator
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let visibilityString = value.string else {
      return nil
    }
    
    guard let visibility = Visibility(visibilityString) else {
      return nil
    }
    
    return view.presentationDragIndicator(visibility)
  }
}

#Preview {
  DebugView {
    TextNode("Sheet with visible drag indicator")
      .padding()
      .background(ColorNode("#FF0000"))
      .sheet(isPresented: true) {
        VStackNode {
          TextNode("No Drag Indicator")
            .font(.title)
            .padding(40)
        }
        .presentationDetents(.medium)
        .presentationDragIndicator(.hidden)
      }
  }
}
