import SwiftUI
import SwiftUIMLCore
public struct RadialGradientRenderer: ViewRenderer {
  public static let type: ViewType = .radialGradient

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    // Parse center and radius values (default: center point, 0->300 radius)
    let center = UnitPoint(node.attributes[.center]?.string) ?? .center
    let startRadius = node.attributes[.startRadius]?.cgFloat ?? 0
    let endRadius = node.attributes[.endRadius]?.cgFloat ?? 300

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

      return RadialGradient(
        gradient: Gradient(stops: stops),
        center: center,
        startRadius: startRadius,
        endRadius: endRadius
      ).applyModifiers(node, context: context, handler: messageHandler)
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

    return RadialGradient(
      colors: colors,
      center: center,
      startRadius: startRadius,
      endRadius: endRadius
    ).applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    RadialGradientNode(
      colors: ["#FF0000", "#0000FF"]
    )
    .frame(width: 200, height: 200)
    RadialGradientNode(
      colorStops: [
        ("#FF6B6B", 0.0),
        ("#4ECDC4", 0.2),
        ("#45B7D1", 1.0),
      ],
      center: .topLeading,
      endRadius: 500
    )
    .frame(width: 200, height: 200)
  }
  .padding()
}
