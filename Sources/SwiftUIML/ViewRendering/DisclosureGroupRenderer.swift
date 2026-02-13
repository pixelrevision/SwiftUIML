import SwiftUI
import SwiftUIMLCore

public struct DisclosureGroupRenderer: ViewRenderer {
  public static let type: ViewType = .disclosureGroup

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let label = node.attributes[.label]?.string ?? ""
    let initialIsExpanded = node.attributes[.isExpanded]?.bool ?? false
    let onExpandedChange = node.attributes[.onExpandedChange]
    let children = node.children ?? []

    return DisclosureGroupView(
      label: label,
      initialIsExpanded: initialIsExpanded,
      onExpandedChange: onExpandedChange,
      children: children,
      context: context,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

private struct DisclosureGroupView: View {
  let label: String
  let initialIsExpanded: Bool
  let onExpandedChange: AttributeValue?
  let children: [Node]
  let context: RenderContext
  let messageHandler: MessageHandler?

  @State private var isExpanded: Bool

  init(
    label: String,
    initialIsExpanded: Bool,
    onExpandedChange: AttributeValue?,
    children: [Node],
    context: RenderContext,
    messageHandler: MessageHandler?
  ) {
    self.label = label
    self.initialIsExpanded = initialIsExpanded
    self.onExpandedChange = onExpandedChange
    self.children = children
    self.context = context
    self.messageHandler = messageHandler
    _isExpanded = State(initialValue: initialIsExpanded)
  }

  var body: some View {
    DisclosureGroup(label, isExpanded: $isExpanded) {
      NodeChildViews(for: Node(type: .group, attributes: [:], children: children), messageHandler: messageHandler)
    }
    .onChange(of: isExpanded) { oldValue, newValue in
      handleExpandedChange(oldValue: oldValue, newValue: newValue)
    }
    .onChange(of: initialIsExpanded) { _, newValue in
      isExpanded = newValue
    }
  }

  private func handleExpandedChange(oldValue: Bool, newValue: Bool) {
    if let onExpandedChange = onExpandedChange, let messageHandler = messageHandler {
      let wrappedMessage = wrapMessage(onExpandedChange, addingToContext: [
        .isExpanded: AttributeValue(newValue),
        .oldValue: AttributeValue(oldValue),
      ])
      messageHandler(wrappedMessage)
    }
  }
}

#Preview {
  DebugView {
    DisclosureGroupNode("Details") {
      TextNode("This is the content inside the disclosure group")
      TextNode("It can be expanded or collapsed")
    }
    .onExpandedChange("Details")
    .padding()
    
    DisclosureGroupNode("Settings", isExpanded: true) {
      ToggleNode("Dark Mode", isOn: true)
        .padding(5)
      ToggleNode("Notifications", isOn: false)
        .padding(5)
      SliderNode(value: 0.5)
        .padding(5)
    }
    .onExpandedChange("Settings")
    .padding()
  }
  .messageHandler { message in
    print("Message:", message)
  }
}
