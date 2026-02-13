import SwiftUI
import SwiftUIMLCore
public struct ImageRenderer: ViewRenderer {
  public static let type: ViewType = .image

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    if let source = node.attributes[.name]?.string {
      let bundle = Bundle(identifier: node.attributes[.bundle]?.string ?? "") ?? .main
      let image = Image(source, bundle: bundle)
      return image.applyModifiers(node, context: context, handler: messageHandler)
    }
    else if let system = node.attributes[.systemName]?.string {
      return Image(systemName: system)
        .applyModifiers(node, context: context, handler: messageHandler)
    }
    return EmptyView()
  }
}

#Preview {
  DebugView {
    ImageNode(systemName: "desktopcomputer")
      .resizable()
      .aspectRatio(1.0, contentMode: .fit)
      .foregroundColor("#007AFF")
      .padding()
  }
}
