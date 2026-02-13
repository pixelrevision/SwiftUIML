import SwiftUI
import SwiftUIMLCore

public struct AnimationModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .animation

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let animationDict = value.dict,
      let attributeName = animationDict[.attribute]?.string
    else {
      return nil
    }
    let watchedValue = node.attributes[AttributeKey(attributeName)]
    // Build the SwiftUI animation
    guard let swiftUIAnimation = Animation.from(value) else {
      return nil
    }
    // Apply the animation, watching the specified attribute
    return view.animation(swiftUIAnimation, value: watchedValue)
  }
}

#Preview {
  AnimationPreview()
}

private struct AnimationPreview: View {
  @State private var node = Self.red()
  @State private var isOn = true
  
  var body: some View {
    VStack {
      DebugView(node)
      Divider()
      Button("Toggle") {
        isOn.toggle()
        node = isOn ? Self.red() : self.green()
      }
    }
  }
  
  static func red() -> Node {
    TextNode("Hello")
      .id("text-field")
      .foregroundColor("red")
      .font(size: 30)
      .animation(.easeInOut(duration: 1), attribute: .foregroundColor)
  }
  
  func green() -> Node {
    TextNode("Hello")
      .id("text-field")
      .foregroundColor("green")
      .font(size: 30)
      .animation(.easeInOut(duration: 1), attribute: .foregroundColor)
  }
}
