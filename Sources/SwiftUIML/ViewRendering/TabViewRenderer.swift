import SwiftUI
import SwiftUIMLCore
public struct TabViewRenderer: ViewRenderer {
  public static let type: ViewType = .tabView

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return TabView {
      if let children = node.children {
        ForEach(children, id: \.id) { childNode in
          // Render tab content directly without AnyView wrapper
          // so TabView can use .tabItem() and .tag() modifiers
          let content = NodeView(childNode, messageHandler: messageHandler)

          // Apply tabItem if present
          if let tabItemDict = childNode.attributes[.tabItem]?.dict {
            content.tabItem {
              if let systemName = tabItemDict[.systemName]?.string {
                Image(systemName: systemName)
              }
              if let text = tabItemDict[.text]?.string {
                Text(text)
              }
            }
            .tag(childNode.attributes[.tag]?.string ?? childNode.id)
          }
          else {
            content
          }
        }
      }
    }.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    TabViewNode {
      VStackNode(spacing: 16) {
        ImageNode(systemName: "house.fill")
          .font(size: 60)
        TextNode("Home")
          .font(.title)
      }
      .tabItem([
        .systemName: "house.fill",
        .text: "Home",
      ])
      .tag("home")

      VStackNode(spacing: 16) {
        ImageNode(systemName: "magnifyingglass")
          .font(size: 60)
        TextNode("Search")
          .font(.title)
      }
      .tabItem([
        .systemName: "magnifyingglass",
        .text: "Search",
      ])
      .tag("search")
      
      VStackNode(spacing: 16) {
        ImageNode(systemName: "person.fill")
          .font(size: 60)
        TextNode("Profile")
          .font(.title)
      }
      .tabItem([
        .systemName: "person.fill",
        .text: "Profile",
      ])
      .tag("profile")
    }
    .tint("red")
  }
}
