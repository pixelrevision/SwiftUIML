import SwiftUI
import SwiftUIMLCore

public struct ColorPickerRenderer: ViewRenderer {
  public static let type: ViewType = .colorPicker

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let label = node.attributes[.label]?.string ?? ""
    let initialValue = node.attributes[.value]?.string
    let onColorChange = node.attributes[.onColorChange]
    let supportsOpacity = node.attributes[.supportsOpacity]?.bool ?? true

    return ColorPickerView(
      label: label,
      initialValue: initialValue,
      onColorChange: onColorChange,
      supportsOpacity: supportsOpacity,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

/// Internal view that maintains ColorPicker state
private struct ColorPickerView: View {
  let label: String
  let initialValue: String?
  let onColorChange: AttributeValue?
  let supportsOpacity: Bool
  let messageHandler: MessageHandler?

  @State private var color: Color

  init(
    label: String,
    initialValue: String?,
    onColorChange: AttributeValue?,
    supportsOpacity: Bool,
    messageHandler: MessageHandler?
  ) {
    self.label = label
    self.initialValue = initialValue
    self.onColorChange = onColorChange
    self.supportsOpacity = supportsOpacity
    self.messageHandler = messageHandler
    self._color = State(initialValue: Self.parseColor(initialValue))
  }

  var body: some View {
    ColorPicker(label, selection: $color, supportsOpacity: supportsOpacity)
      .onChange(of: color) { oldValue, newValue in
        if let onColorChange = onColorChange, let messageHandler = messageHandler {
          let wrappedMessage = wrapMessage(onColorChange, addingToContext: [
            .value: AttributeValue(Self.formatColor(newValue, supportsOpacity)),
            .oldValue: AttributeValue(Self.formatColor(oldValue, supportsOpacity)),
          ])
          messageHandler(wrappedMessage)
        }
      }
      .onChange(of: initialValue) { _, newValue in
        // Sync with server value changes
        let newColor = Self.parseColor(newValue)
        if Self.formatColor(newColor, supportsOpacity) != Self.formatColor(color, supportsOpacity) {
          color = newColor
        }
      }
  }

  /// Parses color string to Color
  private static func parseColor(_ colorString: String?) -> Color {
    guard let colorString = colorString else {
      return .blue  // Default color
    }
    return Color(colorString)
  }

  /// Formats Color to hex string with alpha
  private static func formatColor(_ color: Color, _ supportsOpacity: Bool) -> String {
    // Convert SwiftUI Color to UIColor to extract components
    let uiColor = UIColor(color)
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0

    uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

    let r = Int(red * 255)
    let g = Int(green * 255)
    let b = Int(blue * 255)
    let a = Int(alpha * 255)
    if supportsOpacity {
      return String(format: "#%02X%02X%02X%02X", r, g, b, a)
    }
    else {
      return String(format: "#%02X%02X%02X", r, g, b)
    }
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20, alignment: .leading) {
      ColorPickerNode("Pick a color")
        .supportsOpacity(false)
        .onColorChange("colorChanged")
    }
    .padding()
  }.messageHandler { message in
    print("Message:", message)
  }
}
