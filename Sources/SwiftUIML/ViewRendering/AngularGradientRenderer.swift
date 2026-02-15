import SwiftUI
import SwiftUIMLCore
public struct AngularGradientRenderer: ViewRenderer {
  public static let type: ViewType = .angularGradient

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    // Parse center and angle values (default: center point, 0°->360°)
    let center = UnitPoint(node.attributes[.center]?.string) ?? .center
    let startAngle = Angle(degrees: node.attributes[.startAngle]?.double ?? 0)
    let endAngle = Angle(degrees: node.attributes[.endAngle]?.double ?? 360)

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

      return AngularGradient(
        gradient: Gradient(stops: stops),
        center: center,
        startAngle: startAngle,
        endAngle: endAngle
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

    return AngularGradient(
      colors: colors,
      center: center,
      startAngle: startAngle,
      endAngle: endAngle
    ).applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    AngularGradientNode(
      colors: ["#FF0000", "#00FF00", "#0000FF", "#FF0000"]
    )
    .frame(width: 300, height: 300)

    AngularGradientNode(
      colorStops: [
        ("#FF6B6B", 0.0),
        ("#4ECDC4", 0.75),
        ("#45B7D1", 1.0),
      ],
      center: .topLeading,
      startAngle: 0,
      endAngle: 90
    )
    .frame(width: 300, height: 300)
  }
  .padding()
}
