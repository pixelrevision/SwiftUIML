import SwiftUI
import SwiftUIMLCore
/// Utility for applying fill and stroke styles to SwiftUI shapes
enum ShapeStyleApplicator {
  /// Applies fill or stroke from node attributes to a shape, then applies remaining modifiers
  /// - Parameters:
  ///   - shape: The SwiftUI shape to style
  ///   - node: The node containing attributes
  ///   - context: Render context for applying modifiers
  ///   - messageHandler: Optional message handler
  /// - Returns: Styled view ready for AnyView wrapping
  static func applyStyle<S: Shape>(
    to shape: S,
    node: Node,
    context: RenderContext,
    messageHandler: MessageHandler?
  ) -> any View {
    // Apply trim first (if present) since it returns a Shape
    var trimmedShape: any Shape = shape
    if let trimValue = node.attributes[.trim] {
      if let dict = trimValue.dict {
        let from = dict[.from]?.cgFloat ?? 0
        let to = dict[.to]?.cgFloat ?? 1
        trimmedShape = shape.trim(from: from, to: to)
      }
      else if let from = trimValue.cgFloat {
        // If just a number, treat it as "to" with from=0
        trimmedShape = shape.trim(from: 0, to: from)
      }
    }
    
    var styledView: any View = trimmedShape
    
    // Handle fill OR stroke (SwiftUI only allows one, as both return View not Shape)
    // Fill takes precedence if both are present
    if let fillValue = node.attributes[.fill] {
      // Fill the shape
      if let fillNode = fillValue.node {
        styledView = fillWithGradient(shape: trimmedShape, gradientNode: fillNode)
      }
      else if let color = Color(fillValue) {
        styledView = trimmedShape.fill(color)
      }
    }
    else if let strokeValue = node.attributes[.stroke] {
      // Stroke the shape
      if let dict = strokeValue.dict, let colorValue = dict[.color], let color = Color(colorValue) {
        let lineWidth = dict[.lineWidth]?.cgFloat ?? 1
        styledView = trimmedShape.stroke(color, lineWidth: lineWidth)
      }
      else if let color = Color(strokeValue) {
        styledView = trimmedShape.stroke(color, lineWidth: 1)
      }
    }
    
    // Apply remaining modifiers (excluding fill/stroke/trim which are already applied)
    let filteredAttributes = Node.Attributes(
      node.attributes.filter {
        $0.key != .fill && $0.key != .stroke && $0.key != .trim
      }
    )
    
    let tempNode = Node(type: node.type, attributes: filteredAttributes)
    return styledView.applyModifiers(
      tempNode,
      context: context,
      handler: messageHandler
    )
  }
  
  /// Fills a shape with a gradient node
  private static func fillWithGradient<S: Shape>(shape: S, gradientNode: Node) -> any View {
    switch gradientNode.type {
    case .linearGradient:
      let colors = (gradientNode.attributes[.colors]?.array ?? [])
        .compactMap { Color($0) }
      let startPoint = UnitPoint(gradientNode.attributes[.startPoint]?.string) ?? .top
      let endPoint = UnitPoint(gradientNode.attributes[.endPoint]?.string) ?? .bottom
      return shape.fill(
        LinearGradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
      )
    case .radialGradient:
      let colors = (gradientNode.attributes[.colors]?.array ?? [])
        .compactMap { Color($0) }
      let center = UnitPoint(gradientNode.attributes[.center]?.string) ?? .center
      let startRadius = gradientNode.attributes[.startRadius]?.cgFloat ?? 0
      let endRadius = gradientNode.attributes[.endRadius]?.cgFloat ?? 300
      return shape.fill(
        RadialGradient(colors: colors, center: center, startRadius: startRadius, endRadius: endRadius)
      )
    case .angularGradient:
      let colors = (gradientNode.attributes[.colors]?.array ?? [])
        .compactMap { Color($0) }
      let center = UnitPoint(gradientNode.attributes[.center]?.string) ?? .center
      let startAngle = Angle(degrees: gradientNode.attributes[.startAngle]?.double ?? 0)
      let endAngle = Angle(degrees: gradientNode.attributes[.endAngle]?.double ?? 360)
      return shape.fill(
        AngularGradient(colors: colors, center: center, startAngle: startAngle, endAngle: endAngle)
      )
    default:
      // Fallback for unsupported fill types
      return shape
    }
  }
}
