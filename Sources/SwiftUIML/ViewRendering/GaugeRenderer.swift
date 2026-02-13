import SwiftUI
import SwiftUIMLCore

public struct GaugeRenderer: ViewRenderer {
  public static let type: ViewType = .gauge

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let minimumValue = node.attributes[.minimumValue]?.float ?? 0
    let maximumValue = node.attributes[.maximumValue]?.float ?? 1
    let value = node.attributes[.value]?.float ?? minimumValue

    let gauge: any View = Gauge(value: value, in: minimumValue...maximumValue) {
      labelView(for: node.attributes[.label], context: context, messageHandler: messageHandler)
    }
    currentValueLabel: {
      labelView(for: node.attributes[.currentValueLabel], context: context, messageHandler: messageHandler)
    }
    minimumValueLabel: {
      labelView(for: node.attributes[.minimumValueLabel], context: context, messageHandler: messageHandler)
    }
    maximumValueLabel: {
      labelView(for: node.attributes[.maximumValueLabel], context: context, messageHandler: messageHandler)
    }
    return gauge.applyModifiers(node, context: context, handler: messageHandler)
  }
  
  @ViewBuilder
  private static func labelView(
    for attr: AttributeValue?,
    context: RenderContext,
    messageHandler: MessageHandler?
  ) -> some View {
    if let value = attr?.node {
      NodeView(value, messageHandler: messageHandler)
    }
    else if let value = attr?.string {
      Text(value)
    }
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      GaugeNode("Speed", value: 0.7, minimumValue: 0, maximumValue: 1)
        .currentValueLabel("0.7")
        .minimumValueLabel("0")
        .maximumValueLabel("1")

      GaugeNode("Battery", value: 0.45, minimumValue: 0, maximumValue: 1)
        .tint("green")

      GaugeNode("Temperature", value: 75, minimumValue: 0, maximumValue: 100)
        .tint("red")
    }
  }
  .padding()
}
