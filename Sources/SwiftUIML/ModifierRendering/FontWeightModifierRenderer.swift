import SwiftUI
import SwiftUIMLCore
public struct FontWeightModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .fontWeight

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let weight = Font.Weight(value.string) else {
      return nil
    }
    
    return view.fontWeight(weight)
  }
}

#Preview {
  DebugView {
    TextNode("Light")
      .fontWeight(.light)
    
    TextNode("Regular")
      .fontWeight(.regular)
    
    TextNode("Bold")
      .fontWeight(.bold)
    
    TextNode("Heavy")
      .fontWeight(.heavy)
  }
}
