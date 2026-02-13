import SwiftUI
import SwiftUIMLCore
public struct DisabledModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .disabled
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let isDisabled = value.bool else {
      return nil
    }
    
    return view.disabled(isDisabled)
  }
}

#Preview {
  DebugView {
    ButtonNode("Enabled", onTap: "tap")
      .padding(10)
    
    ButtonNode("Disabled", onTap: "tap")
      .padding(10)
      .disabled(true)
  }
  .messageHandler { message in
    print("Message: \(message)")
  }
}
