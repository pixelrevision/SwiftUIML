import SwiftUI
import SwiftUIMLCore
public struct ProgressViewRenderer: ViewRenderer {
  public static let type: ViewType = .progressView

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let progressView: any View

    // Check if we have value and total for determinate progress
    if let value = node.attributes[.value]?.float,
      let total = node.attributes[.total]?.float {
      // Determinate progress (with value)
      if let label = node.attributes[.label]?.string {
        progressView = ProgressView(label, value: value, total: total)
      }
      else {
        progressView = ProgressView(value: value, total: total)
      }
    }
    else if let currentValue = node.attributes[.currentValue]?.float,
      let total = node.attributes[.total]?.float {
      // Alternative format using currentValue
      if let label = node.attributes[.label]?.string {
        progressView = ProgressView(label, value: currentValue, total: total)
      }
      else {
        progressView = ProgressView(value: currentValue, total: total)
      }
    }
    else {
      // Indeterminate progress (no value)
      if let label = node.attributes[.label]?.string {
        progressView = ProgressView(label)
      }
      else {
        progressView = ProgressView()
      }
    }
    return progressView.applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  DebugView {
    ProgressViewNode()
      .tint("green")
    
    ProgressViewNode(label: "Processing")
    
    ProgressViewNode(value: 0.3, total: 1.0)
      .tint("red")
    
    ProgressViewNode(label: "Uploading", value: 0.65, total: 1.0)
  }
  .padding()
}
