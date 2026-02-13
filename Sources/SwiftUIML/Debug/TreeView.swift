import SwiftUI
import SwiftUIMLCore
public struct TreeView: View {
  let node: Node
  public enum DisplayOptions {
    case none
    case color
  }
  let display: DisplayOptions

  public init(node: Node, display: DisplayOptions = .color) {
    self.node = node
    self.display = display
  }

  public var body: some View {
    VStack {
      CopyLogView(value: node.formatted())
      ScrollView {
        textView()
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.system(.body, design: .monospaced))
          .padding()
      }
    }
  }

  private func textView() -> some View {
    switch display {
    case .none: Text(node.formatted())
    case .color: Text(node.formattedAttributed())
    }
  }
}

#Preview {
  TreeView(node: Node(
    type: ViewType("test"),
    attributes: sampleAttr(),
    children: [
      Node(
        type: ViewType("child"),
        attributes: sampleAttr()
      ),
    ]
  ))
}

private func sampleAttr() -> Node.Attributes {
  return [
    .init("string"): "value",
    .init("bool"): true,
    .init("dict"): [.id: "value1"],
    .init("number"): 100.5,
    .init("array"): [1, "2", true],
  ]
}
