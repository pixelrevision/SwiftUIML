import SwiftUI
import SwiftUIMLCore
public struct TextRenderer: ViewRenderer {
  public static let type: ViewType = .text

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    var text: any View
    if let textValue = node.attributes[.text]?.string {
      text = Text(textValue)
    }
    else if let attrString = markdown(for: node) {
      text = Text(attrString)
    }
    else {
      text = Text("")
    }
    return text.applyModifiers(node, context: context, handler: messageHandler)
  }

  private static func markdown(for node: Node) -> AttributedString? {
    guard
      let string = node.attributes[.markdown]?.string,
      let attrString = try? AttributedString(markdown: string)
    else {
      return nil
    }
    return attrString
  }
}

#Preview {
  DebugView {
    TextNode("I am some multiline text\nthis is another line\nand another")
      .font(.body)
      .fontWeight(.black)
      .multilineTextAlignment(.leading)
      .padding()
    
    TextNode(markdown: "Markdown with **bold** and *italic*")
  }
}
