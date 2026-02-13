import SwiftUI
import SwiftUIMLCore
public struct TabItemModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .tabItem

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let dict = value.dict else {
      return nil
    }

    return view.tabItem {
      // Support text and/or icon
      if let systemName = dict[.systemName]?.string {
        Image(systemName: systemName)
      }
      if let text = dict[.text]?.string {
        Text(text)
      }
    }
  }
}

#Preview {
  DebugView {
    TabViewNode {
      VStackNode(spacing: 20) {
        ImageNode(systemName: "house.fill")
          .foregroundColor("#007AFF")
        TextNode("Home View")
          .font(.title)
      }
      .tabItem("house.fill", text: "Home")

      VStackNode(spacing: 20) {
        ImageNode(systemName: "magnifyingglass")
          .foregroundColor("#007AFF")
        TextNode("Search View")
          .font(.title)
      }
      .tabItem("magnifyingglass", text: "Search")

      VStackNode(spacing: 20) {
        ImageNode(systemName: "person.fill")
          .foregroundColor("#007AFF")
        TextNode("Profile View")
          .font(.title)
      }
      .tabItem("person.fill", text: "Profile")
    }
  }
}
