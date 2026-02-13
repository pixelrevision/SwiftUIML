import SwiftUI
import SwiftUIMLCore
public struct ColorSchemeConditionalModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .colorSchemeConditional
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    // Parse color scheme conditional attributes
    // Format: {light: {url: "..."}, dark: {url: "..."}}
    let conditionalView = ColorSchemeConditionalView(
      content: AnyView(view),
      conditionalValue: value,
      messageHandler: messageHandler
    )
    return conditionalView
  }
}

/// Internal view that applies attributes based on active color scheme
private struct ColorSchemeConditionalView: View {
  let content: AnyView
  let conditionalValue: AttributeValue
  let messageHandler: MessageHandler?
  
  @Environment(\.colorScheme) private var colorScheme
  
  var body: some View {
    let matchingAttrs = evaluateColorScheme()
    let tempNode = Node(type: .group, attributes: matchingAttrs)
    return AnyView(
      content.applyModifiers(tempNode, context: .default, handler: messageHandler)
    )
  }
  
  /// Evaluates which attributes to apply based on current color scheme
  private func evaluateColorScheme() -> Node.Attributes {
    guard let conditionalDict = conditionalValue.dict else {
      return Node.Attributes()
    }
    // Determine which key to look for based on active color scheme
    let schemeKey: AttributeKey = colorScheme == .dark ? .dark : .light
    // Try to get attributes for the active color scheme
    if let attrsValue = conditionalDict[schemeKey], let attrs = attrsValue.orderedDict {
      return attrs
    }
    // Fallback: if dark mode attrs not found, try light mode (and vice versa)
    let fallbackKey: AttributeKey = colorScheme == .dark ? .light : .dark
    if let attrsValue = conditionalDict[fallbackKey], let attrs = attrsValue.orderedDict {
      return attrs
    }
    return Node.Attributes()
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      // Example: Different image URLs for light/dark mode
      ImageNode(systemName: "sun.max.fill")
        .resizable()
        .colorSchemeConditional([
          .light: [.foregroundColor: "#FF0000"],
          .dark: [.foregroundColor: "#00FF00"],
        ])
        .frame(width: 150, height: 150)
    }
    .padding()
  }
}
