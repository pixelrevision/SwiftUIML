import SwiftUI
import SwiftUIMLCore

public struct NavigationBarBackButtonHiddenModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .navigationBarBackButtonHidden

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    return view.navigationBarBackButtonHidden(value.bool ?? false)
  }
}

#Preview {
  DebugView {
    NavigationStackNode {
      VStackNode(spacing: 16) {
        NavigationLinkNode("Go to Settings", value: "settings")
          .padding(12)
          .backgroundColor("#34C759")
          .foregroundColor("#FFFFFF")
          .cornerRadius(8)
      }
      .padding()
      .navigationDestinations {
        VStackNode {
          TextNode("Settings View")
            .font(.title)
            .padding()
        }
        .navigationDestinationKey("settings")
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
      }
    }
  }
}
