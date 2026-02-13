import SwiftUI
import SwiftUIMLCore
public struct ScrollIndicatorsModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .scrollIndicators

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let visibilityString = value.string else {
      return nil
    }
    
    let visibility: ScrollIndicatorVisibility
    switch visibilityString {
    case "automatic":
      visibility = .automatic
    case "visible":
      visibility = .visible
    case "hidden":
      visibility = .hidden
    case "never":
      visibility = .never
    default:
      return nil
    }
    
    // Can optionally specify axes
    var axes: Axis.Set = [.vertical, .horizontal]
    if let axisDict = value.dict?[.axis] {
      axes = Axis.Set(axisDict)
    }
    
    return view.scrollIndicators(visibility, axes: axes)
  }
}

#Preview {
  DebugView {
    ScrollViewNode {
      VStackNode(spacing: 8) {
        ForEachNode(1...20) { i in
          TextNode("Item \(i)")
        }
      }
    }
    .scrollIndicators(.hidden)
    .frame(height: 100)
  }
}
