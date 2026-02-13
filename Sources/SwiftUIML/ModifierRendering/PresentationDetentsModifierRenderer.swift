import SwiftUI
import SwiftUIMLCore

public struct PresentationDetentsModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .presentationDetents
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Handle single string value (e.g., "medium", "large")
    if let detentString = value.string {
      if let detent = PresentationDetent(detentString) {
        return view.presentationDetents([detent])
      }
      return nil
    }
    
    // Handle single dict value (e.g., {"type": "fraction", "value": 0.5})
    if let dict = value.dict {
      if let detent = PresentationDetent(dict) {
        return view.presentationDetents([detent])
      }
      return nil
    }
    
    // Handle array of detents
    guard let array = value.array else {
      return nil
    }
    
    var detents: Set<PresentationDetent> = []
    
    for item in array {
      if let detentString = item.string, let detent = PresentationDetent(detentString) {
        detents.insert(detent)
      }
      else if let dict = item.dict, let detent = PresentationDetent(dict) {
        detents.insert(detent)
      }
    }
    
    guard !detents.isEmpty else {
      return nil
    }
    
    return view.presentationDetents(detents)
  }
}

#Preview {
  DebugView {
    TextNode("Sheet with custom detent")
      .padding()
      .ignoreEquatable()
      .sheet(isPresented: true) {
        VStackNode {
          TextNode("Custom Height Sheet")
            .font(.title)
            .padding(40)
        }
        .presentationDetents([.fraction(0.3), .height(300)])
      }
      .ignoreEquatable()
  }
}
