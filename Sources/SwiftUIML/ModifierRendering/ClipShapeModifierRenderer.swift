import SwiftUI
import SwiftUIMLCore
public struct ClipShapeModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .clipShape

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let shapeNode = value.node else { return nil }
    
    // Apply clipShape based on the shape type
    switch shapeNode.type {
    case .circle:
      return view.clipShape(Circle())
    case .rectangle:
      return view.clipShape(Rectangle())
    case .roundedRectangle:
      let cornerRadius = shapeNode.attributes[.cornerRadius]?.cgFloat ?? 8
      return view.clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    case .capsule:
      return view.clipShape(Capsule())
    case .ellipse:
      return view.clipShape(Ellipse())
    default:
      return nil
    }
  }
}

#Preview {
  DebugView {
    ImageNode(systemName: "photo.fill")
      .font(size: 120)
      .foregroundColor("#FF3B30")
      .frame(width: 120, height: 120)
      .clipShape(CircleNode())
  }
}
