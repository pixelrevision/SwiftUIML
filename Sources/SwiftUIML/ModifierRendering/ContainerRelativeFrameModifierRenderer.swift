import SwiftUI
import SwiftUIMLCore

public struct ContainerRelativeFrameModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .containerRelativeFrame

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      case .dict(let dict) = value,
      let count = dict[.count]?.int,
      let span = dict[.span]?.int
    else {
      return nil
    }
    // Parse axes - defaults to both if not specified
    let axes: Axis.Set
    if let axis = dict[.axis] {
      axes = .init(axis)
    }
    else {
      axes = [.horizontal, .vertical]
    }
    // Parse alignment
    let alignment = Alignment(dict[.alignment]?.string)
    let spacing = dict[.spacing]?.cgFloat ?? 0
    return view.containerRelativeFrame(axes, count: count, span: span, spacing: spacing, alignment: alignment)
  }
}

#Preview {
  DebugView {
    HStackNode(spacing: 6) {
      ColorNode("blue")
        .containerRelativeFrame(.horizontal, count: 8, span: 1)
      ColorNode("red")
        .containerRelativeFrame(.horizontal, count: 8, span: 4)
      ColorNode("green")
        .containerRelativeFrame(.horizontal, count: 8, span: 3)
    }
    .frame(height: 100)

    VStackNode {
      ColorNode("blue")
        .containerRelativeFrame(.vertical, count: 8, span: 1)
      ColorNode("red")
        .containerRelativeFrame(.vertical, count: 8, span: 3)
      ColorNode("green")
        .containerRelativeFrame(.vertical, count: 8, span: 2)
    }
  }
}
