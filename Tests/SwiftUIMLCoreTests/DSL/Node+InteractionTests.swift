import XCTest
@testable import SwiftUIMLCore

final class NodeInteractionTests: XCTestCase {
  func testOnTapGestureWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "tapped"])
    let node = TextNode("Test").onTapGesture(message)

    XCTAssertEqual(node.attributes[.onTapGesture]?.dict?[.action]?.string, "tapped")
  }

  func testOnTapGestureWithString() {
    let node = TextNode("Test").onTapGesture("tapped")
    XCTAssertEqual(node.attributes[.onTapGesture]?.string, "tapped")
  }

  func testOnTapGestureWithDict() {
    let node = TextNode("Test").onTapGesture([
      .action: "tap",
      .id: "button1",
    ])
    let dict = node.attributes[.onTapGesture]?.dict
    XCTAssertEqual(dict?[.action]?.string, "tap")
    XCTAssertEqual(dict?[.id]?.string, "button1")
  }

  func testOnLongPressGesture() {
    let message: AttributeValue = .dict([.action: "longPress"])
    let node = TextNode("Test").onLongPressGesture(message)

    let dict = node.attributes[.onLongPressGesture]?.dict
    XCTAssertEqual(dict?[.minimumDuration]?.float, 0.5)
    XCTAssertEqual(dict?[.message]?.dict?[.action]?.string, "longPress")
  }

  func testOnLongPressGestureCustomDuration() {
    let message: AttributeValue = .dict([.action: "longPress"])
    let node = TextNode("Test").onLongPressGesture(message, minimumDuration: 1.0)

    let dict = node.attributes[.onLongPressGesture]?.dict
    XCTAssertEqual(dict?[.minimumDuration]?.float, 1.0)
    XCTAssertEqual(dict?[.message]?.dict?[.action]?.string, "longPress")
  }

  func testOnAppearWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "appeared"])
    let node = TextNode("Test").onAppear(message)

    XCTAssertEqual(node.attributes[.onAppear]?.dict?[.action]?.string, "appeared")
  }

  func testOnAppearWithString() {
    let node = TextNode("Test").onAppear("view1")
    XCTAssertEqual(node.attributes[.onAppear]?.string, "view1")
  }

  func testOnAppearWithDict() {
    let node = TextNode("Test").onAppear([
      .action: "appeared",
      .custom("source"): "view1",
    ])

    let dict = node.attributes[.onAppear]?.dict
    XCTAssertEqual(dict?[.action]?.string, "appeared")
    XCTAssertEqual(dict?[.custom("source")]?.string, "view1")
  }

  func testOnDisappearWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "disappeared"])
    let node = TextNode("Test").onDisappear(message)

    XCTAssertEqual(node.attributes[.onDisappear]?.dict?[.action]?.string, "disappeared")
  }

  func testOnDisappearWithString() {
    let node = TextNode("Test").onDisappear("view1")
    XCTAssertEqual(node.attributes[.onDisappear]?.string, "view1")
  }

  func testOnDisappearWithDict() {
    let node = TextNode("Test").onDisappear([
      .action: "disappeared",
      .custom("source"): "view1",
    ])

    let dict = node.attributes[.onDisappear]?.dict
    XCTAssertEqual(dict?[.action]?.string, "disappeared")
    XCTAssertEqual(dict?[.custom("source")]?.string, "view1")
  }

  func testDisabled() {
    let node = ButtonNode("Test", onTap: "tap").disabled()
    XCTAssertEqual(node.attributes[.disabled]?.bool, true)
  }

  func testDisabledExplicit() {
    let node = ButtonNode("Test", onTap: "tap").disabled(false)
    XCTAssertEqual(node.attributes[.disabled]?.bool, false)
  }

  // MARK: - TextField Modifiers

  func testOnTextChangeWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "textChanged"])
    let node = TextFieldNode("Name").onTextChange(message)

    XCTAssertEqual(node.attributes[.onTextChange]?.dict?[.action]?.string, "textChanged")
  }

  func testOnTextChangeWithString() {
    let node = TextFieldNode("Email").onTextChange("emailChanged")
    XCTAssertEqual(node.attributes[.onTextChange]?.string, "emailChanged")
  }

  func testOnTextChangeWithDict() {
    let node = TextFieldNode("Search").onTextChange([
      .action: "search",
      .id: "searchField",
    ])

    let dict = node.attributes[.onTextChange]?.dict
    XCTAssertEqual(dict?[.action]?.string, "search")
    XCTAssertEqual(dict?[.id]?.string, "searchField")
  }

  func testOnSubmitWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "submitted"])
    let node = TextFieldNode("Query").onSubmit(message)

    XCTAssertEqual(node.attributes[.onSubmit]?.dict?[.action]?.string, "submitted")
  }

  func testOnSubmitWithString() {
    let node = TextFieldNode("Username").onSubmit("usernameSubmitted")
    XCTAssertEqual(node.attributes[.onSubmit]?.string, "usernameSubmitted")
  }

  func testOnSubmitWithDict() {
    let node = TextFieldNode("Password").onSubmit([
      .action: "login",
      .custom("form"): "loginForm",
    ])

    let dict = node.attributes[.onSubmit]?.dict
    XCTAssertEqual(dict?[.action]?.string, "login")
    XCTAssertEqual(dict?[.custom("form")]?.string, "loginForm")
  }

  func testOnFocusWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "focused"])
    let node = TextFieldNode("Input").onFocus(message)

    XCTAssertEqual(node.attributes[.onFocus]?.dict?[.action]?.string, "focused")
  }

  func testOnFocusWithString() {
    let node = TextFieldNode("Field").onFocus("fieldFocused")
    XCTAssertEqual(node.attributes[.onFocus]?.string, "fieldFocused")
  }

  func testOnFocusWithDict() {
    let node = TextFieldNode("Comment").onFocus([
      .action: "focusGained",
      .id: "commentField",
    ])

    let dict = node.attributes[.onFocus]?.dict
    XCTAssertEqual(dict?[.action]?.string, "focusGained")
    XCTAssertEqual(dict?[.id]?.string, "commentField")
  }

  func testOnBlurWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "blurred"])
    let node = TextFieldNode("Input").onBlur(message)

    XCTAssertEqual(node.attributes[.onBlur]?.dict?[.action]?.string, "blurred")
  }

  func testOnBlurWithString() {
    let node = TextFieldNode("Field").onBlur("fieldBlurred")
    XCTAssertEqual(node.attributes[.onBlur]?.string, "fieldBlurred")
  }

  func testOnBlurWithDict() {
    let node = TextFieldNode("Note").onBlur([
      .action: "focusLost",
      .custom("validate"): true,
    ])

    let dict = node.attributes[.onBlur]?.dict
    XCTAssertEqual(dict?[.action]?.string, "focusLost")
    XCTAssertEqual(dict?[.custom("validate")]?.bool, true)
  }

  func testTextFieldWithAllModifiers() {
    let node = TextFieldNode("Search", value: "query")
      .onTextChange([.action: "search"])
      .onSubmit([.action: "submitSearch"])
      .onFocus([.action: "searchFocused"])
      .onBlur([.action: "searchBlurred"])

    XCTAssertEqual(node.attributes[.placeholder]?.string, "Search")
    XCTAssertEqual(node.attributes[.value]?.string, "query")
    XCTAssertEqual(node.attributes[.onTextChange]?.dict?[.action]?.string, "search")
    XCTAssertEqual(node.attributes[.onSubmit]?.dict?[.action]?.string, "submitSearch")
    XCTAssertEqual(node.attributes[.onFocus]?.dict?[.action]?.string, "searchFocused")
    XCTAssertEqual(node.attributes[.onBlur]?.dict?[.action]?.string, "searchBlurred")
  }

  // MARK: - Toggle Modifiers

  func testOnToggleWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "toggled"])
    let node = ToggleNode("Notifications").onToggle(message)

    XCTAssertEqual(node.attributes[.onToggle]?.dict?[.action]?.string, "toggled")
  }

  func testOnToggleWithString() {
    let node = ToggleNode("Dark mode").onToggle("darkModeToggled")
    XCTAssertEqual(node.attributes[.onToggle]?.string, "darkModeToggled")
  }

  func testOnToggleWithDict() {
    let node = ToggleNode("Airplane mode").onToggle([
      .action: "toggle",
      .id: "airplane",
    ])

    let dict = node.attributes[.onToggle]?.dict
    XCTAssertEqual(dict?[.action]?.string, "toggle")
    XCTAssertEqual(dict?[.id]?.string, "airplane")
  }

  func testToggleWithModifier() {
    let node = ToggleNode("Wi-Fi", isOn: true)
      .onToggle([.action: "wifiToggled"])

    XCTAssertEqual(node.attributes[.label]?.string, "Wi-Fi")
    XCTAssertEqual(node.attributes[.isOn]?.bool, true)
    XCTAssertEqual(node.attributes[.onToggle]?.dict?[.action]?.string, "wifiToggled")
  }

  // MARK: - Slider Modifiers

  func testOnSliderChangeWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "sliderChanged"])
    let node = SliderNode().onSliderChange(message)

    XCTAssertEqual(node.attributes[.onSliderChange]?.dict?[.action]?.string, "sliderChanged")
  }

  func testOnSliderChangeWithString() {
    let node = SliderNode().onSliderChange("volumeChanged")
    XCTAssertEqual(node.attributes[.onSliderChange]?.string, "volumeChanged")
  }

  func testOnSliderChangeWithDict() {
    let node = SliderNode().onSliderChange([
      .action: "adjust",
      .id: "volumeSlider",
    ])

    let dict = node.attributes[.onSliderChange]?.dict
    XCTAssertEqual(dict?[.action]?.string, "adjust")
    XCTAssertEqual(dict?[.id]?.string, "volumeSlider")
  }

  func testSliderWithModifier() {
    let node = SliderNode(value: 50, minimumValue: 0, maximumValue: 100, step: 5)
      .onSliderChange([.action: "brightnessChanged"])

    XCTAssertEqual(node.attributes[.value]?.float, 50)
    XCTAssertEqual(node.attributes[.minimumValue]?.float, 0)
    XCTAssertEqual(node.attributes[.maximumValue]?.float, 100)
    XCTAssertEqual(node.attributes[.step]?.float, 5)
    XCTAssertEqual(node.attributes[.onSliderChange]?.dict?[.action]?.string, "brightnessChanged")
  }

  // MARK: - Stepper Modifiers

  func testOnStepperChangeWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "stepperChanged"])
    let node = StepperNode("Volume").onStepperChange(message)

    XCTAssertEqual(node.attributes[.onStepperChange]?.dict?[.action]?.string, "stepperChanged")
  }

  func testOnStepperChangeWithString() {
    let node = StepperNode("Volume").onStepperChange("volumeChanged")
    XCTAssertEqual(node.attributes[.onStepperChange]?.string, "volumeChanged")
  }

  func testOnStepperChangeWithDict() {
    let node = StepperNode("Volume").onStepperChange([
      .action: "adjust",
      .id: "volumeStepper",
    ])

    let dict = node.attributes[.onStepperChange]?.dict
    XCTAssertEqual(dict?[.action]?.string, "adjust")
    XCTAssertEqual(dict?[.id]?.string, "volumeStepper")
  }

  func testStepperWithModifier() {
    let node = StepperNode("Brightness", value: 50, minimumValue: 0, maximumValue: 100, step: 5)
      .onStepperChange([.action: "brightnessChanged"])

    XCTAssertEqual(node.attributes[.label]?.string, "Brightness")
    XCTAssertEqual(node.attributes[.value]?.float, 50)
    XCTAssertEqual(node.attributes[.minimumValue]?.float, 0)
    XCTAssertEqual(node.attributes[.maximumValue]?.float, 100)
    XCTAssertEqual(node.attributes[.step]?.float, 5)
    XCTAssertEqual(node.attributes[.onStepperChange]?.dict?[.action]?.string, "brightnessChanged")
  }

  // MARK: - Picker Modifiers

  func testOnPickerChangeWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "pickerChanged"])
    let node = PickerNode("Fruit") {
      TextNode("Apple").tag("apple")
    }.onPickerChange(message)

    XCTAssertEqual(node.attributes[.onPickerChange]?.dict?[.action]?.string, "pickerChanged")
  }

  func testOnPickerChangeWithString() {
    let node = PickerNode("Color") {
      TextNode("Red").tag("red")
    }.onPickerChange("colorChanged")
    XCTAssertEqual(node.attributes[.onPickerChange]?.string, "colorChanged")
  }

  func testOnPickerChangeWithDict() {
    let node = PickerNode("Size") {
      TextNode("Small").tag("small")
    }.onPickerChange([
      .action: "sizeChanged",
      .id: "sizePicker",
    ])

    let dict = node.attributes[.onPickerChange]?.dict
    XCTAssertEqual(dict?[.action]?.string, "sizeChanged")
    XCTAssertEqual(dict?[.id]?.string, "sizePicker")
  }

  func testPickerWithModifier() {
    let node = PickerNode("Fruit", selection: "apple") {
      TextNode("Apple").tag("apple")
      TextNode("Banana").tag("banana")
      TextNode("Orange").tag("orange")
    }
    .onPickerChange([.action: "fruitChanged"])

    XCTAssertEqual(node.attributes[.label]?.string, "Fruit")
    XCTAssertEqual(node.attributes[.selection]?.string, "apple")
    XCTAssertEqual(node.attributes[.onPickerChange]?.dict?[.action]?.string, "fruitChanged")
    XCTAssertEqual(node.children?.count, 3)
  }

  // MARK: - DisclosureGroup Modifiers

  func testOnExpandedChangeWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "expansionChanged"])
    let node = DisclosureGroupNode("Details") {
      TextNode("Content")
    }.onExpandedChange(message)

    XCTAssertEqual(node.attributes[.onExpandedChange]?.dict?[.action]?.string, "expansionChanged")
  }

  func testOnExpandedChangeWithString() {
    let node = DisclosureGroupNode("Settings") {
      TextNode("Option 1")
    }.onExpandedChange("settingsExpanded")
    XCTAssertEqual(node.attributes[.onExpandedChange]?.string, "settingsExpanded")
  }

  func testOnExpandedChangeWithDict() {
    let node = DisclosureGroupNode("Advanced") {
      TextNode("Advanced option")
    }.onExpandedChange([
      .action: "advancedExpanded",
      .id: "advancedGroup",
    ])

    let dict = node.attributes[.onExpandedChange]?.dict
    XCTAssertEqual(dict?[.action]?.string, "advancedExpanded")
    XCTAssertEqual(dict?[.id]?.string, "advancedGroup")
  }

  func testDisclosureGroupWithModifier() {
    let node = DisclosureGroupNode("Options", isExpanded: true) {
      ToggleNode("Dark Mode")
      SliderNode(value: 0.5)
    }
    .onExpandedChange([.action: "optionsExpanded"])

    XCTAssertEqual(node.attributes[.label]?.string, "Options")
    XCTAssertEqual(node.attributes[.isExpanded]?.bool, true)
    XCTAssertEqual(node.attributes[.onExpandedChange]?.dict?[.action]?.string, "optionsExpanded")
    XCTAssertEqual(node.children?.count, 2)
  }
}
