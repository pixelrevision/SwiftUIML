import SwiftUI
import SwiftUIMLCore
public struct JSONView: View {
  let node: Node

  public var body: some View {
    VStack {
      CopyLogView(value: node.jsonFormatted())
      ScrollView {
        Text(node.jsonFormatted())
          .font(.system(.body, design: .monospaced))
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
  }
}

#Preview {
  JSONView(node: Node(
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
