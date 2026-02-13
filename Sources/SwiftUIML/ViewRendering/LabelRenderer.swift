import SwiftUI
import SwiftUIMLCore

public struct LabelRenderer: ViewRenderer {
  public static let type: ViewType = .label

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    guard
      let title = node.attributes[.title]?.string,
      let systemName = node.attributes[.systemName]?.string
    else {
      return EmptyView()
    }
    return Label(title, systemImage: systemName)
      .applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    VStackNode(spacing: 15, alignment: .leading) {
      LabelNode("Home", systemImage: "house")
      LabelNode("Settings", systemImage: "gear")
      LabelNode("Profile", systemImage: "person.circle")
        .font(.title2)
        .foregroundColor("#007AFF")
    }
    .padding()
  }
}
