import SwiftUI
import SwiftUIMLCore
public struct ResponsiveModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .responsive
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Parse responsive breakpoints
    // Format: [{pattern: "w>=200", attributes: [...]}, {pattern: "sm", attributes: [...]}, ...]
    
    let responsiveView = ResponsiveView(
      content: AnyView(view),
      breakpointsValue: value,
      messageHandler: messageHandler
    )
    
    return responsiveView
  }
}

/// Internal view that applies responsive attributes based on size
private struct ResponsiveView: View {
  let content: AnyView
  let breakpointsValue: AttributeValue
  let messageHandler: MessageHandler?
  
  var body: some View {
    GeometryReader { geometry in
      let matchingAttrs = self.evaluateBreakpoints(size: geometry.size)
      let tempNode = Node(type: .group, attributes: matchingAttrs)
      
      return self.content
        .applyModifiers(tempNode, context: .default, handler: self.messageHandler)
    }
  }
  
  /// Evaluates all breakpoint patterns and returns merged attributes
  /// - Uses mobile-first cascading (later overrides earlier) for >= operators
  /// - Uses first-match-wins for < operators (like ViewThatFits)
  private func evaluateBreakpoints(size: CGSize) -> Node.Attributes { // swiftlint:disable:this cyclomatic_complexity
    var mergedAttrs = Node.Attributes()
    
    // Handle array of breakpoint objects: [{pattern: "w>=200", attributes: [...]}, ...]
    if let breakpointsArray = breakpointsValue.array {
      // Auto-detect: if any pattern uses < or <=, use first-match-wins
      let usesLessThan = breakpointsArray.contains { breakpointValue in
        guard let breakpointDict = breakpointValue.dict else { return false }
        guard let patternString = breakpointDict[.pattern]?.string else { return false }
        return patternString.contains("<")
      }
      
      if usesLessThan {
        // First-match-wins (for less-than operators)
        for breakpointValue in breakpointsArray {
          guard let breakpointDict = breakpointValue.dict else { continue }
          guard let patternString = breakpointDict[.pattern]?.string else { continue }
          guard let pattern = BreakpointPattern(parsing: patternString) else { continue }
          guard pattern.matches(size: size) else { continue }
          guard let attrsValue = breakpointDict[.attributes] else { continue }
          guard let attrs = attrsValue.orderedDict else { continue }
          
          // Return first match immediately
          return attrs
        }
      }
      else {
        // Mobile-first cascading (for >= operators)
        for breakpointValue in breakpointsArray {
          guard let breakpointDict = breakpointValue.dict else { continue }
          guard let patternString = breakpointDict[.pattern]?.string else { continue }
          guard let pattern = BreakpointPattern(parsing: patternString) else { continue }
          guard pattern.matches(size: size) else { continue }
          guard let attrsValue = breakpointDict[.attributes] else { continue }
          guard let attrs = attrsValue.orderedDict else { continue }
          
          // Merge all matching breakpoints (later overrides earlier)
          for (key, value) in attrs {
            mergedAttrs[key] = value
          }
        }
      }
    }
    
    return mergedAttrs
  }
}

/// Creates a responsive node with example breakpoints (scaled for preview)
private func exampleResponsiveNode() -> Node {
  TextNode("Responsive")
    .font(.caption2)  // Base
    .foregroundColor("#999999")
    .padding(2)
    .responsive([
      .w(0): [
        .backgroundColor: .string("#FFE5E5"),
        .foregroundColor: .string("#FF3B30"),
      ],
      .w(100): [
        .font: .string("caption"),
        .foregroundColor: .string("#FF9500"),
        .padding: .number(4),
        .backgroundColor: .string("#FFF3E5"),
      ],
      .w(200): [
        .font: .string("body"),
        .foregroundColor: .string("#007AFF"),
        .padding: .number(6),
        .backgroundColor: .string("#E5F2FF"),
      ],
      .w(300): [
        .font: .string("callout"),
        .foregroundColor: .string("#34C759"),
        .padding: .number(8),
        .bold: .bool(true),
        .backgroundColor: .string("#E5F9E5"),
      ],
    ])
    .cornerRadius(8)
}

#Preview {
  DebugView {
    VStackNode(spacing: 12) {
      // XS: 0-374 (very small)
      VStackNode {
        TextNode("XS (50w)")
          .font(.caption2)
          .foregroundColor("#666666")
        exampleResponsiveNode()
      }
      .frame(width: 50)
      .padding(4)
      .backgroundColor("#F9F9F9")
      .cornerRadius(8)
      
      // XS: approaching SM
      VStackNode {
        TextNode("XS (100w)")
          .font(.caption2)
          .foregroundColor("#666666")
        exampleResponsiveNode()
      }
      .frame(width: 100)
      .padding(4)
      .backgroundColor("#F9F9F9")
      .cornerRadius(8)
      
      // SM: 375-767 (phone)
      VStackNode {
        TextNode("SM (200w)")
          .font(.caption2)
          .foregroundColor("#666666")
        exampleResponsiveNode()
      }
      .frame(width: 200)
      .padding(4)
      .backgroundColor("#F9F9F9")
      .cornerRadius(8)
      
      // SM: full width
      VStackNode {
        TextNode("SM (300w)")
          .font(.caption2)
          .foregroundColor("#666666")
        exampleResponsiveNode()
      }
      .frame(width: 300)
      .padding(4)
      .backgroundColor("#F9F9F9")
      .cornerRadius(8)
    }
    .padding(8)
  }
}
