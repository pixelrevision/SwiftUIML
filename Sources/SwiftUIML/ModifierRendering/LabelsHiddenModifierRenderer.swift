import SwiftUI
import SwiftUIMLCore

public struct LabelsHiddenModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .labelsHidden

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard value.bool == true else {
      return nil
    }
    
    return view.labelsHidden()
  }
}

#Preview {
  DebugView {
    FormNode {
      PickerNode("Hidden", selection: "1") {
        TextNode("Option 1").tag("1")
        TextNode("Option 2").tag("2")
      }
      .labelsHidden()

      PickerNode("Not Hidden", selection: "1") {
        TextNode("Option 1").tag("1")
        TextNode("Option 2").tag("2")
      }
    }
  }
}
