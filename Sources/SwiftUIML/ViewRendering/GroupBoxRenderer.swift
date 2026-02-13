import SwiftUI
import SwiftUIMLCore

public struct GroupBoxRenderer: ViewRenderer {
  public static let type: ViewType = .groupBox

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let labelValue = node.attributes[.label]
    let children = node.children ?? []

    // Handle different label types
    if let labelNode = labelValue?.node {
      // Custom label node
      return GroupBox {
        NodeChildViews(for: Node(type: .group, attributes: [:], children: children), messageHandler: messageHandler)
      }
      label: {
        NodeView(labelNode, messageHandler: messageHandler)
      }
      .applyModifiers(node, context: context, handler: messageHandler)
    }
    else if let labelString = labelValue?.string {
      // String label
      return GroupBox(labelString) {
        NodeChildViews(for: Node(type: .group, attributes: [:], children: children), messageHandler: messageHandler)
      }
      .applyModifiers(node, context: context, handler: messageHandler)
    }
    else {
      // No label
      return GroupBox {
        NodeChildViews(for: Node(type: .group, attributes: [:], children: children), messageHandler: messageHandler)
      }
      .applyModifiers(node, context: context, handler: messageHandler)
    }
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 20) {
      // Basic GroupBox with string label
      GroupBoxNode("User Information") {
        TextNode("Name: John Doe")
          .font(.body)
        TextNode("Email: john@example.com")
          .font(.body)
        TextNode("Role: Developer")
          .font(.body)
      }

      // GroupBox without label
      GroupBoxNode {
        TextNode("This is a group box without a label")
          .font(.body)
        TextNode("It still has the styled container")
          .font(.body)
      }

      // GroupBox with custom label node
      GroupBoxNode(
        label: HStackNode {
          ImageNode(systemName: "star.fill")
            .foregroundColor("#FFD700")
          TextNode("Premium Features")
            .font(.headline)
        }
      ) {
        TextNode("• Unlimited storage")
        TextNode("• Priority support")
        TextNode("• Advanced analytics")
      }
    }
    .padding()
  }
}
