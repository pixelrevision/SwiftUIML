import SwiftUI
import SwiftUIMLCore

public struct FormRenderer: ViewRenderer {
  public static let type: ViewType = .form

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return Form {
      NodeChildViews(for: node, messageHandler: messageHandler)
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    FormNode {
      SectionNode {
        PickerNode("Fruit", selection: "apple") {
          TextNode("Apple").tag("apple")
          TextNode("Banana").tag("banana")
          TextNode("Orange").tag("orange")
        }

        PickerNode("Color", selection: "red") {
          TextNode("Red").tag("red")
          TextNode("Green").tag("green")
          TextNode("Blue").tag("blue")
        }

        ToggleNode("Dark Mode", isOn: true)
      }
    }
  }
  .messageHandler { message in
    print("Message: \(message)")
  }
}
