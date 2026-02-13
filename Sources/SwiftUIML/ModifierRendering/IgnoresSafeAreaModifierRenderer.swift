import SwiftUI
import SwiftUIMLCore

public struct IgnoresSafeAreaModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .ignoresSafeArea

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Support simple boolean (ignore all safe areas)
    if let boolValue = value.bool, boolValue {
      return view.ignoresSafeArea()
    }

    // Support edges specification
    if let edgesString = value.string, let edges = Edge.Set(string: edgesString) {
      return view.ignoresSafeArea(edges: edges)
    }

    // Support dictionary with edges
    if let dict = value.dict,
      let edgesString = dict[.init("edges")]?.string,
      let edges = Edge.Set(string: edgesString) {
      return view.ignoresSafeArea(edges: edges)
    }

    return nil
  }
}

#Preview {
  DebugView {
    ZStackNode {
      ColorNode("#007AFF")
        .ignoresSafeArea(.all)
      
      ColorNode("#00FF0033")
    }
  }
}
