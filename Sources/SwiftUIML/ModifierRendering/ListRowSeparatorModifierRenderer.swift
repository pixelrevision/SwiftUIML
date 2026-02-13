import SwiftUI
import SwiftUIMLCore

public struct ListRowSeparatorModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .listRowSeparator

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Handle simple string value for visibility
    if let visibilityString = value.string {
      guard let visibility = Visibility(visibilityString) else {
        return nil
      }
      return view.listRowSeparator(visibility)
    }
    // Handle dict with visibility and edges
    guard let dict = value.dict else {
      return nil
    }
    guard
      let visibilityString = dict[.visibility]?.string,
      let visibility = Visibility(visibilityString)
    else {
      return nil
    }

    if let edgesString = dict[.edges]?.string {
      let edges = VerticalEdge.Set(edgesString)
      return view.listRowSeparator(visibility, edges: edges)
    }

    return view.listRowSeparator(visibility)
  }
}

#Preview {
  DebugView {
    ListNode {
      TextNode("Row 1 - Separator: automatic")
        .listRowSeparator(visibility: .automatic)
      
      TextNode("Row 2 - Separator: visible")
        .listRowSeparator(visibility: .visible)
      
      TextNode("Row 3 - Separator: hidden")
        .listRowSeparator(visibility: .hidden)
      
      TextNode("Row 4 - Normal (for comparison)")
      
      TextNode("Row 5 - Hidden separator on bottom edge")
        .listRowSeparator(visibility: .hidden, edges: .bottom)
      
      TextNode("Row 6 - Normal (for comparison)")
    }
    .listStyle(.insetGrouped)
    .frame(width: 350, height: 500)
  }
}
