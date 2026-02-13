import SwiftUI
import SwiftUIMLCore

public struct SliderRenderer: ViewRenderer {
  public static let type: ViewType = .slider

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let initialValue = node.attributes[.value]?.float ?? 0.5
    let minimumValue = node.attributes[.minimumValue]?.float ?? 0.0
    let maximumValue = node.attributes[.maximumValue]?.float ?? 1.0
    let step = node.attributes[.step]?.float
    let onSliderChange = node.attributes[.onSliderChange]

    return SliderView(
      initialValue: initialValue,
      minimumValue: minimumValue,
      maximumValue: maximumValue,
      step: step,
      onSliderChange: onSliderChange,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

private struct SliderView: View {
  let initialValue: Double
  let minimumValue: Double
  let maximumValue: Double
  let step: Double?
  let onSliderChange: AttributeValue?
  let messageHandler: MessageHandler?

  @State private var value: Double

  init(
    initialValue: Double,
    minimumValue: Double,
    maximumValue: Double,
    step: Double?,
    onSliderChange: AttributeValue?,
    messageHandler: MessageHandler?
  ) {
    self.initialValue = initialValue
    self.minimumValue = minimumValue
    self.maximumValue = maximumValue
    self.step = step
    self.onSliderChange = onSliderChange
    self.messageHandler = messageHandler
    _value = State(initialValue: initialValue)
  }

  var body: some View {
    Group {
      if let step = step {
        Slider(value: $value, in: minimumValue...maximumValue, step: step)
          .onChange(of: value) { oldValue, newValue in
            handleValueChange(oldValue: oldValue, newValue: newValue)
          }
      }
      else {
        Slider(value: $value, in: minimumValue...maximumValue)
          .onChange(of: value) { oldValue, newValue in
            handleValueChange(oldValue: oldValue, newValue: newValue)
          }
      }
    }
    .onChange(of: initialValue) { _, newValue in
      value = newValue
    }
  }

  private func handleValueChange(oldValue: Double, newValue: Double) {
    if let onSliderChange = onSliderChange, let messageHandler = messageHandler {
      let wrappedMessage = wrapMessage(onSliderChange, addingToContext: [
        .value: AttributeValue(newValue),
        .oldValue: AttributeValue(oldValue),
      ])
      messageHandler(wrappedMessage)
    }
  }
}

#Preview {
  DebugView {
    SliderNode(value: 0.5, minimumValue: 0, maximumValue: 1, step: nil)
      .onSliderChange("sliderChanged")
      .id("slider-1")
    
    SliderNode(value: 5, minimumValue: 0, maximumValue: 20, step: 5)
      .onSliderChange("sliderChanged")
      .id("slider-2")
  }
  .messageHandler { message in
    print("Message: \(message)")
  }
  .padding()
}
