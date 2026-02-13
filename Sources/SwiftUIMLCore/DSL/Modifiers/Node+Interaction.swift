import Foundation

public extension Node {
  /// Adds a tap gesture handler
  /// - Parameter message: Message to send when tapped
  func onTapGesture(_ message: AttributeValue) -> Node {
    addingAttribute(.onTapGesture, value: message)
  }

  /// Adds a tap gesture handler with a string message
  /// - Parameter message: String message to send when tapped
  func onTapGesture(_ message: String) -> Node {
    addingAttribute(.onTapGesture, value: .string(message))
  }

  /// Adds a tap gesture handler with a dictionary message
  /// - Parameter message: Dictionary message to send when tapped
  func onTapGesture(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onTapGesture, value: .dict(message))
  }

  /// Adds a long press gesture handler
  /// - Parameters:
  ///   - message: Message to send when long pressed
  ///   - minimumDuration: Minimum duration for the long press
  func onLongPressGesture(_ message: AttributeValue, minimumDuration: Double = 0.5) -> Node {
    addingAttribute(.onLongPressGesture, value: [
      .minimumDuration: .number(minimumDuration),
      .message: message,
    ])
  }

  /// Adds an onAppear handler
  /// - Parameter message: Message to send when view appears
  func onAppear(_ message: AttributeValue) -> Node {
    addingAttribute(.onAppear, value: message)
  }

  /// Adds an onAppear handler with a string message
  /// - Parameter message: String message to send when view appears
  func onAppear(_ message: String) -> Node {
    addingAttribute(.onAppear, value: .string(message))
  }

  /// Adds an onAppear handler with a dictionary message
  /// - Parameter message: Dictionary message to send when view appears
  func onAppear(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onAppear, value: .dict(message))
  }

  /// Adds an action to perform when the view disappears
  /// - Parameter message: Message to send when view disappears
  func onDisappear(_ message: AttributeValue) -> Node {
    addingAttribute(.onDisappear, value: message)
  }

  /// Adds an onDisappear handler with a string message
  /// - Parameter message: String message to send when view disappears
  func onDisappear(_ message: String) -> Node {
    addingAttribute(.onDisappear, value: .string(message))
  }

  /// Adds an onDisappear handler with a dictionary message
  /// - Parameter message: Dictionary message to send when view disappears
  func onDisappear(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onDisappear, value: .dict(message))
  }

  /// Disables user interaction with the view
  /// - Parameter disabled: Whether the view should be disabled
  func disabled(_ disabled: Bool = true) -> Node {
    addingAttribute(.disabled, value: .bool(disabled))
  }

  /// Adds a text change handler for TextField
  /// - Parameter message: Message to send when text changes (text and oldText available in context)
  func onTextChange(_ message: AttributeValue) -> Node {
    addingAttribute(.onTextChange, value: message)
  }

  /// Adds a text change handler with a string message
  /// - Parameter message: String message to send when text changes
  func onTextChange(_ message: String) -> Node {
    addingAttribute(.onTextChange, value: .string(message))
  }

  /// Adds a text change handler with a dictionary message
  /// - Parameter message: Dictionary message to send when text changes
  func onTextChange(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onTextChange, value: .dict(message))
  }

  /// Adds a submit handler for TextField
  /// - Parameter message: Message to send when TextField is submitted (text available in context)
  func onSubmit(_ message: AttributeValue) -> Node {
    addingAttribute(.onSubmit, value: message)
  }

  /// Adds a submit handler with a string message
  /// - Parameter message: String message to send when TextField is submitted
  func onSubmit(_ message: String) -> Node {
    addingAttribute(.onSubmit, value: .string(message))
  }

  /// Adds a submit handler with a dictionary message
  /// - Parameter message: Dictionary message to send when TextField is submitted
  func onSubmit(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onSubmit, value: .dict(message))
  }

  /// Adds a focus handler for TextField
  /// - Parameter message: Message to send when TextField gains focus (text available in context)
  func onFocus(_ message: AttributeValue) -> Node {
    addingAttribute(.onFocus, value: message)
  }

  /// Adds a focus handler with a string message
  /// - Parameter message: String message to send when TextField gains focus
  func onFocus(_ message: String) -> Node {
    addingAttribute(.onFocus, value: .string(message))
  }

  /// Adds a focus handler with a dictionary message
  /// - Parameter message: Dictionary message to send when TextField gains focus
  func onFocus(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onFocus, value: .dict(message))
  }

  /// Adds a blur handler for TextField
  /// - Parameter message: Message to send when TextField loses focus (text available in context)
  func onBlur(_ message: AttributeValue) -> Node {
    addingAttribute(.onBlur, value: message)
  }

  /// Adds a blur handler with a string message
  /// - Parameter message: String message to send when TextField loses focus
  func onBlur(_ message: String) -> Node {
    addingAttribute(.onBlur, value: .string(message))
  }

  /// Adds a blur handler with a dictionary message
  /// - Parameter message: Dictionary message to send when TextField loses focus
  func onBlur(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onBlur, value: .dict(message))
  }

  /// Adds a toggle handler for Toggle
  /// - Parameter message: Message to send when Toggle state changes (isOn available in context)
  func onToggle(_ message: AttributeValue) -> Node {
    addingAttribute(.onToggle, value: message)
  }

  /// Adds a toggle handler with a string message
  /// - Parameter message: String message to send when Toggle state changes
  func onToggle(_ message: String) -> Node {
    addingAttribute(.onToggle, value: .string(message))
  }

  /// Adds a toggle handler with a dictionary message
  /// - Parameter message: Dictionary message to send when Toggle state changes
  func onToggle(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onToggle, value: .dict(message))
  }

  /// Adds a slider change handler for Slider
  /// - Parameter message: Message to send when Slider value changes (value available in context)
  func onSliderChange(_ message: AttributeValue) -> Node {
    addingAttribute(.onSliderChange, value: message)
  }

  /// Adds a slider change handler with a string message
  /// - Parameter message: String message to send when Slider value changes
  func onSliderChange(_ message: String) -> Node {
    addingAttribute(.onSliderChange, value: .string(message))
  }

  /// Adds a slider change handler with a dictionary message
  /// - Parameter message: Dictionary message to send when Slider value changes
  func onSliderChange(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onSliderChange, value: .dict(message))
  }

  /// Adds a stepper change handler for Stepper
  /// - Parameter message: Message to send when Stepper value changes (value available in context)
  func onStepperChange(_ message: AttributeValue) -> Node {
    addingAttribute(.onStepperChange, value: message)
  }

  /// Adds a stepper change handler with a string message
  /// - Parameter message: String message to send when Stepper value changes
  func onStepperChange(_ message: String) -> Node {
    addingAttribute(.onStepperChange, value: .string(message))
  }

  /// Adds a stepper change handler with a dictionary message
  /// - Parameter message: Dictionary message to send when Stepper value changes
  func onStepperChange(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onStepperChange, value: .dict(message))
  }

  // MARK: - Picker Modifiers

  /// Adds a picker change handler for Picker
  /// - Parameter message: Message to send when Picker selection changes (selection available in context)
  func onPickerChange(_ message: AttributeValue) -> Node {
    addingAttribute(.onPickerChange, value: message)
  }

  /// Adds a picker change handler with a string message
  /// - Parameter message: String message to send when Picker selection changes
  func onPickerChange(_ message: String) -> Node {
    addingAttribute(.onPickerChange, value: .string(message))
  }

  /// Adds a picker change handler with a dictionary message
  /// - Parameter message: Dictionary message to send when Picker selection changes
  func onPickerChange(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onPickerChange, value: .dict(message))
  }

  // MARK: - DisclosureGroup Modifiers

  /// Adds an expanded change handler for DisclosureGroup
  /// - Parameter message: Message to send when DisclosureGroup expanded state changes (isExpanded available in context)
  func onExpandedChange(_ message: AttributeValue) -> Node {
    addingAttribute(.onExpandedChange, value: message)
  }

  /// Adds an expanded change handler with a string message
  /// - Parameter message: String message to send when DisclosureGroup expanded state changes
  func onExpandedChange(_ message: String) -> Node {
    addingAttribute(.onExpandedChange, value: .string(message))
  }

  /// Adds an expanded change handler with a dictionary message
  /// - Parameter message: Dictionary message to send when DisclosureGroup expanded state changes
  func onExpandedChange(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onExpandedChange, value: .dict(message))
  }

  // MARK: - DatePicker Modifiers

  /// Adds a date change handler for DatePicker
  /// - Parameter message: Message to send when DatePicker date changes (date and oldDate available in context)
  func onDateChange(_ message: AttributeValue) -> Node {
    addingAttribute(.onDateChange, value: message)
  }

  /// Adds a date change handler with a string message
  /// - Parameter message: String message to send when DatePicker date changes
  func onDateChange(_ message: String) -> Node {
    addingAttribute(.onDateChange, value: .string(message))
  }

  /// Adds a date change handler with a dictionary message
  /// - Parameter message: Dictionary message to send when DatePicker date changes
  func onDateChange(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onDateChange, value: .dict(message))
  }

  /// Sets which components of the date to display
  /// - Parameter components: The date/time components to display
  func displayedComponents(_ components: DatePickerComponents) -> Node {
    addingAttribute(.displayedComponents, value: .string(components.rawValue))
  }

  /// Sets the minimum selectable date
  /// - Parameter date: ISO8601 date string
  func minimumDate(_ date: String) -> Node {
    addingAttribute(.minimumDate, value: .string(date))
  }

  /// Sets the maximum selectable date
  /// - Parameter date: ISO8601 date string
  func maximumDate(_ date: String) -> Node {
    addingAttribute(.maximumDate, value: .string(date))
  }

  /// Sets the minimum selectable date
  /// - Parameter date: Date value (automatically converted to ISO8601)
  func minimumDate(_ date: Date) -> Node {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    return minimumDate(formatter.string(from: date))
  }

  /// Sets the maximum selectable date
  /// - Parameter date: Date value (automatically converted to ISO8601)
  func maximumDate(_ date: Date) -> Node {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    return maximumDate(formatter.string(from: date))
  }

  // MARK: - ColorPicker Modifiers

  /// Adds a color change handler for ColorPicker
  /// - Parameter message: Message to send when ColorPicker color changes (color and oldColor available in context)
  func onColorChange(_ message: AttributeValue) -> Node {
    addingAttribute(.onColorChange, value: message)
  }

  /// Adds a color change handler with a string message
  /// - Parameter message: String message to send when ColorPicker color changes
  func onColorChange(_ message: String) -> Node {
    addingAttribute(.onColorChange, value: .string(message))
  }

  /// Adds a color change handler with a dictionary message
  /// - Parameter message: Dictionary message to send when ColorPicker color changes
  func onColorChange(_ message: [AttributeKey: AttributeValue]) -> Node {
    addingAttribute(.onColorChange, value: .dict(message))
  }

  /// Sets whether the color picker supports opacity/alpha channel
  /// - Parameter supports: Whether to show opacity slider (default: true)
  func supportsOpacity(_ supports: Bool = true) -> Node {
    addingAttribute(.supportsOpacity, value: .bool(supports))
  }
  
  /// If set to true removes equatability checks which can sometimes be needed in order to have
  /// certain types render correctly due to equality checks changing the underlying types.
  /// - Parameter ignore: If equatability should be ignored for this node
  func ignoreEquatable(_ ignore: Bool = true) -> Node {
    addingAttribute(.ignoreEquatable, value: .bool(ignore))
  }
}
