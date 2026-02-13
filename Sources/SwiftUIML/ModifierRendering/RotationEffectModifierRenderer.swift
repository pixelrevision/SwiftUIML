import SwiftUI
import SwiftUIMLCore

public struct RotationEffectModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .rotationEffect

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Support both single number (degrees) and dict with degrees/radians/anchor
    if let degrees = value.cgFloat {
      // Single value - rotation in degrees
      return view.rotationEffect(.degrees(degrees))
    }

    guard let dict = value.dict else {
      return nil
    }
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
    let anchor = UnitPoint(dict[.anchor]?.string ?? "") ?? .center
    return view.rotationEffect(angle, anchor: anchor)
  }
}

#Preview {
  DebugView {
    SpacerNode()
    TextNode("Hello, World!")
      .rotationEffect(degrees: 90, anchor: .center)
    SpacerNode()
  }
}
