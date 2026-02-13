import SwiftUI
import SwiftUIMLCore
public struct ScrollBounceBehaviorModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .scrollBounceBehavior

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    let behavior = ScrollBounceBehavior(value)
    var axis: Axis.Set = .vertical
    if let axisDict = value.dict?[.axis] {
      axis = Axis.Set(axisDict)
    }
    return view.scrollBounceBehavior(behavior, axes: axis)
  }
}

#Preview {
  DebugView {
    ScrollViewNode {
      VStackNode {
        ForEachNode(1...3) { i in
          TextNode("Item \(i)")
            .padding(8)
            .id("\(i)")
        }
      }
    }
    .scrollBounceBehavior(.basedOnSize)
    .frame(height: 180)

    ScrollViewNode {
      VStackNode {
        ForEachNode(1...3) { i in
          TextNode("Item \(i)")
            .padding(8)
            .id("\(i)")
        }
      }
    }
    .scrollBounceBehavior(.always)
    .frame(height: 180)
  }
}
