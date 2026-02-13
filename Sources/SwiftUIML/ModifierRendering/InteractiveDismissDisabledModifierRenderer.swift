import SwiftUI
import SwiftUIMLCore

public struct InteractiveDismissDisabledModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .interactiveDismissDisabled
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Support both boolean and no-argument forms
    return view.interactiveDismissDisabled(value.bool ?? true)
  }
}

#Preview {
  DebugView {
    TextNode("Sheet with dismiss disabled")
      .padding()
      .sheet(isPresented: true) {
        VStackNode {
          TextNode("Cannot dismiss by dragging")
            .font(.title)
            .padding(40)
        }
        .presentationDetents(.medium)
        .interactiveDismissDisabled(true)
      }
  }
}
