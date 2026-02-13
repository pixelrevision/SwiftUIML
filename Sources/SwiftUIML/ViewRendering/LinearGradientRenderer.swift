import SwiftUI
import SwiftUIMLCore
public struct LinearGradientRenderer: ViewRenderer {
  public static let type: ViewType = .linearGradient

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    // Parse start and end points (default to top -> bottom)
    let startPoint = UnitPoint(node.attributes[.startPoint]?.string) ?? .top
    let endPoint = UnitPoint(node.attributes[.endPoint]?.string) ?? .bottom

    // Check for color stops first (precise positioning)
    if let stopsArray = node.attributes[.colorStops]?.array {
      let stops: [Gradient.Stop] = stopsArray.compactMap { stopValue in
        guard
          let dict = stopValue.dict,
          let colorString = dict[.color]?.string,
          let location = dict[.location]?.cgFloat
        else {
          return nil
        }
        return Gradient.Stop(color: Color(colorString), location: location)
      }

      guard !stops.isEmpty else {
        return EmptyView()
      }

      return LinearGradient(
        gradient: Gradient(stops: stops),
        startPoint: startPoint,
        endPoint: endPoint
      )
      .applyModifiers(node, context: context, handler: messageHandler)
    }

    // Fallback to evenly-distributed colors
    guard let colorsArray = node.attributes[.colors]?.array else {
      return EmptyView()
    }

    let colors: [Color] = colorsArray.compactMap { colorValue in
      guard let colorString = colorValue.string else {
        return nil
      }
      return Color(colorString)
    }

    guard !colors.isEmpty else {
      return EmptyView()
    }

    return LinearGradient(
      colors: colors,
      startPoint: startPoint,
      endPoint: endPoint
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    LinearGradientNode(
      colors: ["#FF0000", "#0000FF"]
    )
    LinearGradientNode(
      colorStops: [
        ("#FF6B6B", 0.0),
        ("#4ECDC4", 0.2),
        ("#45B7D1", 1.0),
      ],
      startPoint: .leading,
      endPoint: .trailing
    )
  }
  .padding()
}
