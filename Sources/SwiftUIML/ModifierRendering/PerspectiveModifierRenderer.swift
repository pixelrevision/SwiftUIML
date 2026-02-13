import SwiftUI
import SwiftUIMLCore

public struct PerspectiveModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .perspective

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let perspectiveValue = value.cgFloat else {
      return nil
    }

    // Apply perspective using a zero-rotation 3D effect with the specified perspective value
    // This creates a perspective context for child 3D transformations
    return view.rotation3DEffect(
      .degrees(0),
      axis: (x: 0, y: 0, z: 1),
      perspective: perspectiveValue
    )
  }
}

#Preview {
  DebugView {
    SpacerNode()
    VStackNode(spacing: 20) {
      TextNode("With Perspective 0.5")
        .font(.title)
        .padding()
        .background(ColorNode("#FF0000"))
        .rotation3DEffect(degrees: 45, axis: (x: 1, y: 0, z: 0))
        .perspective(0.5)

      TextNode("With Perspective 1.0")
        .font(.title)
        .padding()
        .background(ColorNode("#00FF00"))
        .rotation3DEffect(degrees: 45, axis: (x: 1, y: 0, z: 0))
        .perspective(1.0)

      TextNode("No Perspective")
        .font(.title)
        .padding()
        .background(ColorNode("#0000FF"))
        .rotation3DEffect(degrees: 45, axis: (x: 1, y: 0, z: 0))
    }
    SpacerNode()
  }
}
