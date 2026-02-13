import SwiftUI
import SwiftUIMLCore

public struct PickerStyleModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .pickerStyle

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let style = PickerStyle(value) else {
      return nil
    }
    return view.pickerStyle(style)
  }
}

#Preview {
  DebugView {
    FormNode {
      PickerNode("Style", selection: "1") {
        TextNode("Option 1").tag("1")
        TextNode("Option 2").tag("2")
      }
      .pickerStyle(.segmented)

      PickerNode("Style", selection: "1") {
        TextNode("Option 1").tag("1")
        TextNode("Option 2").tag("2")
      }
      .pickerStyle(.menu)
    }
  }
}
