import SwiftUI
import SwiftUIMLCore

public struct StepperRenderer: ViewRenderer {
  public static let type: ViewType = .stepper

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let label = node.attributes[.label]?.string ?? ""
    let initialValue = node.attributes[.value]?.double ?? 0
    let minimumValue = node.attributes[.minimumValue]?.double ?? 0
    let maximumValue = node.attributes[.maximumValue]?.double ?? 100
    let step = node.attributes[.step]?.double ?? 1
    let onStepperChange = node.attributes[.onStepperChange]

    return StepperView(
      label: label,
      initialValue: initialValue,
      minimumValue: minimumValue,
      maximumValue: maximumValue,
      step: step,
      onStepperChange: onStepperChange,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

private struct StepperView: View {
  let label: String
  let initialValue: Double
  let minimumValue: Double
  let maximumValue: Double
  let step: Double
  let onStepperChange: AttributeValue?
  let messageHandler: MessageHandler?

  @State private var value: Double

  init(
    label: String,
    initialValue: Double,
    minimumValue: Double,
    maximumValue: Double,
    step: Double,
    onStepperChange: AttributeValue?,
    messageHandler: MessageHandler?
  ) {
    self.label = label
    self.initialValue = initialValue
    self.minimumValue = minimumValue
    self.maximumValue = maximumValue
    self.step = step
    self.onStepperChange = onStepperChange
    self.messageHandler = messageHandler
    _value = State(initialValue: initialValue)
  }

  var body: some View {
    Stepper(label, value: $value, in: minimumValue...maximumValue, step: step)
      .onChange(of: value) { oldValue, newValue in
        handleValueChange(oldValue: oldValue, newValue: newValue)
      }
      .onChange(of: initialValue) { _, newValue in
        value = newValue
      }
  }

  private func handleValueChange(oldValue: Double, newValue: Double) {
    guard
      let onStepperChange = onStepperChange,
      let messageHandler = messageHandler
    else {
      return
    }
    let wrappedMessage = wrapMessage(onStepperChange, addingToContext: [
      .value: AttributeValue(newValue),
      .oldValue: AttributeValue(oldValue),
    ])
    messageHandler(wrappedMessage)
  }
}

#Preview {
  DebugView {
    StepperNode("Volume", value: 5, minimumValue: 0, maximumValue: 10, step: 1)
      .onStepperChange("stepperChanged")
      .id("stepper-1")

    StepperNode("Brightness", value: 50, minimumValue: 0, maximumValue: 100, step: 5)
      .onStepperChange("stepperChanged")
      .id("stepper-2")
  }
  .messageHandler { message in
    print("Message: \(message)")
  }
  .padding()
}
