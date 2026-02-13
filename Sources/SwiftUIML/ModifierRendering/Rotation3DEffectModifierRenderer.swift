import SwiftUI
import SwiftUIMLCore

public struct Rotation3DEffectModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .rotation3DEffect

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let dict = value.dict else {
      return nil
    }

    // Parse angle (degrees or radians)
    let angle: Angle
    if let degrees = dict[.degrees]?.cgFloat {
      angle = .degrees(degrees)
    }
    else if let radians = dict[.radians]?.cgFloat {
      angle = .radians(radians)
    }
    else {
      return nil
    }

    // Parse axis (x, y, z) - defaults to (0, 0, 1) for z-axis rotation
    let x = dict[.x]?.cgFloat ?? 0
    let y = dict[.y]?.cgFloat ?? 0
    let z = dict[.z]?.cgFloat ?? 1

    // Parse anchor point - defaults to center
    let anchor = UnitPoint(dict[.anchor]?.string) ?? .center

    // Parse anchorZ - defaults to 0
    let anchorZ = dict[.anchorZ]?.cgFloat ?? 0

    // Parse perspective - defaults to 1
    let perspective = dict[.perspective]?.cgFloat ?? 1

    return view.rotation3DEffect(
      angle,
      axis: (x: x, y: y, z: z),
      anchor: anchor,
      anchorZ: anchorZ,
      perspective: perspective
    )
  }
}

#Preview {
  DebugView {
    SpacerNode()
    VStackNode(spacing: 20) {
      TextNode("Rotated 45° on X-axis")
        .font(.title)
        .padding()
        .background(ColorNode("#FF0000"))
        .rotation3DEffect(degrees: 45, axis: (x: 1, y: 0, z: 0))

      TextNode("Rotated 45° on Y-axis")
        .font(.title)
        .padding()
        .background(ColorNode("#00FF00"))
        .rotation3DEffect(degrees: 45, axis: (x: 0, y: 1, z: 0))

      TextNode("Rotated -10° on Z-axis")
        .font(.title)
        .padding()
        .background(ColorNode("#0000FF"))
        .rotation3DEffect(degrees: -10, axis: (x: 0, y: 0, z: 1))
    }
    SpacerNode()
  }
}
