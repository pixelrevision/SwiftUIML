import SwiftUI
import SwiftUIMLCore

public struct SectionRenderer: ViewRenderer {
  public static let type: ViewType = .section

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let header = node.attributes[.header]?.node
    let footer = node.attributes[.footer]?.node

    if let header = header, let footer = footer {
      return Section {
        NodeChildViews(for: node, messageHandler: messageHandler)
      }
      header: {
        NodeView(header, messageHandler: messageHandler)
          .environment(\.renderContext, context)
      }
      footer: {
        NodeView(footer, messageHandler: messageHandler)
          .environment(\.renderContext, context)
      }
      .applyModifiers(node, context: context, handler: messageHandler)
    }
    else if let header = header {
      return Section {
        NodeChildViews(for: node, messageHandler: messageHandler)
      }
      header: {
        NodeView(header, messageHandler: messageHandler)
          .environment(\.renderContext, context)
      }
      .applyModifiers(node, context: context, handler: messageHandler)
    }
    else if let footer = footer {
      return Section {
        NodeChildViews(for: node, messageHandler: messageHandler)
      }
      footer: {
        NodeView(footer, messageHandler: messageHandler)
          .environment(\.renderContext, context)
      }
      .applyModifiers(node, context: context, handler: messageHandler)
    }
    else {
      return Section {
        NodeChildViews(for: node, messageHandler: messageHandler)
      }
      .applyModifiers(node, context: context, handler: messageHandler)
    }
  }
}

#Preview {
  DebugView {
    ListNode {
      SectionNode(header: TextNode("Section 1").font(.headline)) {
        TextNode("Row 1")
        TextNode("Row 2")
      }

      SectionNode(header: TextNode("Section 2").font(.headline)) {
        TextNode("Row 1")
        TextNode("Row 2")
      }
    }
  }
}
