import SwiftUI
import SwiftUIMLCore

public struct PickerRenderer: ViewRenderer {
  public static let type: ViewType = .picker

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let label = node.attributes[.label]?.string ?? ""
    let initialSelection = node.attributes[.selection]?.string ?? ""
    let onPickerChange = node.attributes[.onPickerChange]
    let children = node.children ?? []

    return PickerView(
      label: label,
      initialSelection: initialSelection,
      children: children,
      onPickerChange: onPickerChange,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

private struct PickerView: View {
  let label: String
  let initialSelection: String
  let children: [Node]
  let onPickerChange: AttributeValue?
  let messageHandler: MessageHandler?

  @State private var selection: String

  init(
    label: String,
    initialSelection: String,
    children: [Node],
    onPickerChange: AttributeValue?,
    messageHandler: MessageHandler?
  ) {
    self.label = label
    self.initialSelection = initialSelection
    self.children = children
    self.onPickerChange = onPickerChange
    self.messageHandler = messageHandler
    _selection = State(initialValue: initialSelection)
  }

  var body: some View {
    Picker(label, selection: $selection) {
      ForEach(children) { child in
        if let tagValue = child.attributes[.tag]?.string {
          NodeView(child, messageHandler: messageHandler)
            .tag(tagValue)
        }
      }
    }
    .onChange(of: selection) { oldValue, newValue in
      handleSelectionChange(oldValue: oldValue, newValue: newValue)
    }
    .onChange(of: initialSelection) { _, newValue in
      selection = newValue
    }
  }

  private func handleSelectionChange(oldValue: String, newValue: String) {
    guard
      let onPickerChange = onPickerChange,
      let messageHandler = messageHandler
    else {
      return
    }
    let wrappedMessage = wrapMessage(onPickerChange, addingToContext: [
      .selection: AttributeValue(newValue),
      .oldValue: AttributeValue(oldValue),
    ])
    messageHandler(wrappedMessage)
  }
}

#Preview {
  // Note: Picker labels are for accessibility.
  // In production, wrap pickers in a Form to display labels.
  DebugView {
    VStackNode(spacing: 20, alignment: .leading) {
      PickerNode("Fruit", selection: "apple") {
        TextNode("Apple").tag("apple")
        TextNode("Banana").tag("banana")
        TextNode("Orange").tag("orange")
      }
      .onPickerChange("fruitChanged")
      .id("picker-1")

      DividerNode()
      
      PickerNode("Color", selection: "red") {
        TextNode("Red").tag("red")
        TextNode("Green").tag("green")
        TextNode("Blue").tag("blue")
      }
      .onPickerChange("colorChanged")
      .id("picker-2")
    }
  }
  .messageHandler { message in
    print("Message: \(message)")
  }
  .padding()
}
