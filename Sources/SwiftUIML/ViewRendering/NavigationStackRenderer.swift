import SwiftUI
import SwiftUIMLCore

public struct NavigationStackRenderer: ViewRenderer {
  public static let type: ViewType = .navigationStack

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return NavigationStackContainer(node: node, context: context, messageHandler: messageHandler)
  }
}

private struct NavigationStackContainer: View {
  let node: Node
  let context: RenderContext
  let messageHandler: MessageHandler?

  @State private var path = NavigationPath()

  var body: some View {
    NavigationStack(path: $path) {
      NodeChildViews(for: node, messageHandler: messageHandler)
        .environment(\.navigationPath, $path)
        .applyModifiers(node, context: context, handler: messageHandler)
    }
  }
}

#Preview {
  DebugView {
    NavigationStackNode {
      VStackNode {
        TextNode("Home Screen")
          .font(.title)
          .padding()
        
        TextNode("This is the root view")
          .padding()
      }
      .navigationDestination(value: "Test") {
        TextNode("Pushed to the stack")
      }
    }
    .navigationTitle("Home")
  }
}
