import XCTest
@testable import SwiftUIMLCore

final class ViewNodesTests: XCTestCase {
  func testTextNode() {
    let node = TextNode("Hello, World!")
    XCTAssertEqual(node.type, .text)
    XCTAssertEqual(node.attributes[.text]?.string, "Hello, World!")
  }

  func testTextNodeMarkdown() {
    let node = TextNode(markdown: "**Bold** text")
    XCTAssertEqual(node.type, .text)
    XCTAssertEqual(node.attributes[.markdown]?.string, "**Bold** text")
  }

  func testButtonNodeWithAttributeValue() {
    let message: AttributeValue = .dict([.action: "tap"])
    let node = ButtonNode("Submit", onTap: message)
    XCTAssertEqual(node.type, .button)
    XCTAssertEqual(node.attributes[.title]?.string, "Submit")
    XCTAssertEqual(node.attributes[.onTap]?.dict?[.action]?.string, "tap")
  }

  func testButtonNodeWithString() {
    let node = ButtonNode("Click", onTap: "buttonClicked")
    XCTAssertEqual(node.type, .button)
    XCTAssertEqual(node.attributes[.title]?.string, "Click")
    XCTAssertEqual(node.attributes[.onTap]?.string, "buttonClicked")
  }

  func testButtonNodeWithDict() {
    let node = ButtonNode("Press", onTap: [
      .action: "pressed",
      .id: "btn1",
    ])
    XCTAssertEqual(node.type, .button)
    XCTAssertEqual(node.attributes[.title]?.string, "Press")
    XCTAssertEqual(node.attributes[.onTap]?.dict?[.action]?.string, "pressed")
    XCTAssertEqual(node.attributes[.onTap]?.dict?[.id]?.string, "btn1")
  }

  func testTextFieldNode() {
    let node = TextFieldNode("Enter name")
    XCTAssertEqual(node.type, .textField)
    XCTAssertEqual(node.attributes[.placeholder]?.string, "Enter name")
    XCTAssertNil(node.attributes[.value])
  }

  func testTextFieldNodeWithValue() {
    let node = TextFieldNode("Email", value: "user@example.com")
    XCTAssertEqual(node.type, .textField)
    XCTAssertEqual(node.attributes[.placeholder]?.string, "Email")
    XCTAssertEqual(node.attributes[.value]?.string, "user@example.com")
  }

  func testTextEditorNode() {
    let node = TextEditorNode()
    XCTAssertEqual(node.type, .textEditor)
    XCTAssertNil(node.attributes[.value])
  }

  func testTextEditorNodeWithValue() {
    let node = TextEditorNode(value: "Initial text content")
    XCTAssertEqual(node.type, .textEditor)
    XCTAssertEqual(node.attributes[.value]?.string, "Initial text content")
  }

  func testSecureFieldNode() {
    let node = SecureFieldNode("Enter password")
    XCTAssertEqual(node.type, .secureField)
    XCTAssertEqual(node.attributes[.placeholder]?.string, "Enter password")
    XCTAssertNil(node.attributes[.value])
  }

  func testSecureFieldNodeWithValue() {
    let node = SecureFieldNode("Password", value: "secret123")
    XCTAssertEqual(node.type, .secureField)
    XCTAssertEqual(node.attributes[.placeholder]?.string, "Password")
    XCTAssertEqual(node.attributes[.value]?.string, "secret123")
  }

  func testToggleNode() {
    let node = ToggleNode("Enable notifications")
    XCTAssertEqual(node.type, .toggle)
    XCTAssertEqual(node.attributes[.label]?.string, "Enable notifications")
    XCTAssertEqual(node.attributes[.isOn]?.bool, false)
  }

  func testToggleNodeWithIsOn() {
    let node = ToggleNode("Dark mode", isOn: true)
    XCTAssertEqual(node.type, .toggle)
    XCTAssertEqual(node.attributes[.label]?.string, "Dark mode")
    XCTAssertEqual(node.attributes[.isOn]?.bool, true)
  }

  func testSliderNode() {
    let node = SliderNode()
    XCTAssertEqual(node.type, .slider)
    XCTAssertEqual(node.attributes[.value]?.float, 0.5)
    XCTAssertEqual(node.attributes[.minimumValue]?.float, 0.0)
    XCTAssertEqual(node.attributes[.maximumValue]?.float, 1.0)
    XCTAssertNil(node.attributes[.step])
  }

  func testSliderNodeWithCustomValues() {
    let node = SliderNode(value: 75, minimumValue: 0, maximumValue: 100)
    XCTAssertEqual(node.type, .slider)
    XCTAssertEqual(node.attributes[.value]?.float, 75)
    XCTAssertEqual(node.attributes[.minimumValue]?.float, 0)
    XCTAssertEqual(node.attributes[.maximumValue]?.float, 100)
  }

  func testSliderNodeWithStep() {
    let node = SliderNode(value: 5, minimumValue: 0, maximumValue: 10, step: 1)
    XCTAssertEqual(node.type, .slider)
    XCTAssertEqual(node.attributes[.value]?.float, 5)
    XCTAssertEqual(node.attributes[.step]?.float, 1)
  }

  func testStepperNode() {
    let node = StepperNode("Volume")
    XCTAssertEqual(node.type, .stepper)
    XCTAssertEqual(node.attributes[.label]?.string, "Volume")
    XCTAssertEqual(node.attributes[.value]?.float, 0)
    XCTAssertEqual(node.attributes[.minimumValue]?.float, 0)
    XCTAssertEqual(node.attributes[.maximumValue]?.float, 100)
    XCTAssertEqual(node.attributes[.step]?.float, 1)
  }

  func testStepperNodeWithCustomValues() {
    let node = StepperNode("Brightness", value: 50, minimumValue: 0, maximumValue: 100, step: 5)
    XCTAssertEqual(node.type, .stepper)
    XCTAssertEqual(node.attributes[.label]?.string, "Brightness")
    XCTAssertEqual(node.attributes[.value]?.float, 50)
    XCTAssertEqual(node.attributes[.minimumValue]?.float, 0)
    XCTAssertEqual(node.attributes[.maximumValue]?.float, 100)
    XCTAssertEqual(node.attributes[.step]?.float, 5)
  }

  func testPickerNode() {
    let node = PickerNode("Fruit") {
      TextNode("Apple").tag("apple")
      TextNode("Banana").tag("banana")
    }
    XCTAssertEqual(node.type, .picker)
    XCTAssertEqual(node.attributes[.label]?.string, "Fruit")
    XCTAssertNil(node.attributes[.selection])
    XCTAssertEqual(node.children?.count, 2)
  }

  func testPickerNodeWithSelection() {
    let node = PickerNode("Color", selection: "red") {
      TextNode("Red").tag("red")
      TextNode("Green").tag("green")
      TextNode("Blue").tag("blue")
    }
    XCTAssertEqual(node.type, .picker)
    XCTAssertEqual(node.attributes[.label]?.string, "Color")
    XCTAssertEqual(node.attributes[.selection]?.string, "red")
    XCTAssertEqual(node.children?.count, 3)
  }

  func testDatePickerNode() {
    let node = DatePickerNode("Select Date")
    XCTAssertEqual(node.type, .datePicker)
    XCTAssertEqual(node.attributes[.label]?.string, "Select Date")
    XCTAssertNil(node.attributes[.value])
  }

  func testDatePickerNodeWithValue() {
    let node = DatePickerNode("Birthday", value: "2000-01-01T00:00:00Z")
    XCTAssertEqual(node.type, .datePicker)
    XCTAssertEqual(node.attributes[.label]?.string, "Birthday")
    XCTAssertEqual(node.attributes[.value]?.string, "2000-01-01T00:00:00Z")
  }

  func testDatePickerNodeWithCustomLabel() {
    let labelNode = HStackNode {
      ImageNode(systemName: "calendar")
      TextNode("Pick Date")
    }
    let node = DatePickerNode(label: labelNode, value: "2025-10-25T12:00:00Z")
    XCTAssertEqual(node.type, .datePicker)
    XCTAssertNotNil(node.attributes[.label]?.node)
    XCTAssertEqual(node.attributes[.value]?.string, "2025-10-25T12:00:00Z")
  }

  func testDatePickerNodeWithDateValue() {
    let date = Date(timeIntervalSince1970: 946684800) // 2000-01-01T00:00:00Z
    let node = DatePickerNode("Birthday", value: date)
    XCTAssertEqual(node.type, .datePicker)
    XCTAssertEqual(node.attributes[.label]?.string, "Birthday")
    XCTAssertTrue(node.attributes[.value]?.string?.hasPrefix("2000-01-01T00:00:00") ?? false)
  }

  func testDatePickerNodeWithDateModifiers() {
    let minDate = Date(timeIntervalSince1970: 1735689600) // 2025-01-01
    let maxDate = Date(timeIntervalSince1970: 1767225599) // 2025-12-31
    let node = DatePickerNode("Event")
      .minimumDate(minDate)
      .maximumDate(maxDate)
    XCTAssertEqual(node.type, .datePicker)
    XCTAssertTrue(node.attributes[.minimumDate]?.string?.hasPrefix("2025-01-01") ?? false)
    XCTAssertTrue(node.attributes[.maximumDate]?.string?.hasPrefix("2025-12-31") ?? false)
  }

  func testColorPickerNode() {
    let node = ColorPickerNode("Pick a color")
    XCTAssertEqual(node.type, .colorPicker)
    XCTAssertEqual(node.attributes[.label]?.string, "Pick a color")
    XCTAssertNil(node.attributes[.value])
  }

  func testColorPickerNodeWithValue() {
    let node = ColorPickerNode("Theme Color", value: "#FF5733")
    XCTAssertEqual(node.type, .colorPicker)
    XCTAssertEqual(node.attributes[.label]?.string, "Theme Color")
    XCTAssertEqual(node.attributes[.value]?.string, "#FF5733")
  }

  func testColorPickerNodeWithModifiers() {
    let node = ColorPickerNode("Color")
      .supportsOpacity(false)
      .onColorChange("colorChanged")
    XCTAssertEqual(node.type, .colorPicker)
    XCTAssertEqual(node.attributes[.supportsOpacity]?.bool, false)
    XCTAssertEqual(node.attributes[.onColorChange]?.string, "colorChanged")
  }

  func testLinkNodeWithTitle() {
    let node = LinkNode("Visit Apple", url: "https://apple.com")
    XCTAssertEqual(node.type, .link)
    XCTAssertEqual(node.attributes[.title]?.string, "Visit Apple")
    XCTAssertEqual(node.attributes[.url]?.string, "https://apple.com")
    XCTAssertNil(node.children)
  }

  func testLinkNodeWithCustomContent() {
    let node = LinkNode(url: "https://github.com") {
      HStackNode {
        ImageNode(systemName: "link")
        TextNode("GitHub")
      }
    }
    XCTAssertEqual(node.type, .link)
    XCTAssertEqual(node.attributes[.url]?.string, "https://github.com")
    XCTAssertEqual(node.children?.count, 1)
    XCTAssertEqual(node.children?[0].type, .hStack)
  }

  func testLabelNode() {
    let node = LabelNode("Home", systemImage: "house")
    XCTAssertEqual(node.type, .label)
    XCTAssertEqual(node.attributes[.title]?.string, "Home")
    XCTAssertEqual(node.attributes[.systemName]?.string, "house")
  }

  func testShareLinkNodeWithURL() {
    let node = ShareLinkNode(url: "https://apple.com")
    XCTAssertEqual(node.type, .shareLink)
    XCTAssertEqual(node.attributes[.url]?.string, "https://apple.com")
    XCTAssertNil(node.attributes[.title])
  }

  func testShareLinkNodeWithTitle() {
    let node = ShareLinkNode("Share this", url: "https://apple.com")
    XCTAssertEqual(node.type, .shareLink)
    XCTAssertEqual(node.attributes[.title]?.string, "Share this")
    XCTAssertEqual(node.attributes[.url]?.string, "https://apple.com")
  }

  func testImageNodeNamed() {
    let node = ImageNode(name: "photo")
    XCTAssertEqual(node.type, .image)
    XCTAssertEqual(node.attributes[.name]?.string, "photo")
    XCTAssertNil(node.attributes[.bundle])
  }

  func testImageNodeNamedWithBundle() {
    let node = ImageNode(name: "photo", bundle: "com.example.app")
    XCTAssertEqual(node.type, .image)
    XCTAssertEqual(node.attributes[.name]?.string, "photo")
    XCTAssertEqual(node.attributes[.bundle]?.string, "com.example.app")
  }

  func testImageNodeSystemName() {
    let node = ImageNode(systemName: "star.fill")
    XCTAssertEqual(node.type, .image)
    XCTAssertEqual(node.attributes[.systemName]?.string, "star.fill")
  }

  func testAsyncImageNode() {
    let node = AsyncImageNode(url: "https://example.com/image.png")
    XCTAssertEqual(node.type, .asyncImage)
    XCTAssertEqual(node.attributes[.url]?.string, "https://example.com/image.png")
    XCTAssertNil(node.children)
  }

  func testAsyncImageNodeWithContent() {
    let node = AsyncImageNode(url: "https://example.com/image.png") {
      AsyncImageEmptyNode {
        ProgressViewNode()
      }
      AsyncImageSuccessNode()
        .resizable()
        .aspectRatio(1.0)
      AsyncImageFailureNode {
        TextNode("Failed")
      }
    }
    XCTAssertEqual(node.type, .asyncImage)
    XCTAssertEqual(node.attributes[.url]?.string, "https://example.com/image.png")
    XCTAssertEqual(node.children?.count, 3)
    XCTAssertEqual(node.children?[0].type, .asyncImageEmpty)
    XCTAssertEqual(node.children?[1].type, .asyncImageSuccess)
    XCTAssertEqual(node.children?[2].type, .asyncImageFailure)
  }

  func testColorNode() {
    let node = ColorNode("#FF0000")
    XCTAssertEqual(node.type, .color)
    XCTAssertEqual(node.attributes[.value]?.string, "#FF0000")
  }

  func testColorNodeNamed() {
    let node = ColorNode("blue")
    XCTAssertEqual(node.type, .color)
    XCTAssertEqual(node.attributes[.value]?.string, "blue")
  }

  func testVStackNode() {
    let node = VStackNode {
      TextNode("First")
      TextNode("Second")
    }
    XCTAssertEqual(node.type, .vStack)
    XCTAssertEqual(node.attributes[.alignment]?.string, "center")
    XCTAssertNil(node.attributes[.spacing])
    XCTAssertEqual(node.children?.count, 2)
  }

  func testVStackNodeWithSpacing() {
    let node = VStackNode(spacing: 10) {
      TextNode("First")
    }
    XCTAssertEqual(node.type, .vStack)
    XCTAssertEqual(node.attributes[.spacing]?.float, 10)
  }

  func testVStackNodeWithAlignment() {
    let node = VStackNode(alignment: .leading) {
      TextNode("First")
    }
    XCTAssertEqual(node.type, .vStack)
    XCTAssertEqual(node.attributes[.alignment]?.string, "leading")
  }

  func testHStackNode() {
    let node = HStackNode {
      TextNode("Left")
      TextNode("Right")
    }
    XCTAssertEqual(node.type, .hStack)
    XCTAssertEqual(node.attributes[.alignment]?.string, "center")
  }

  func testZStackNode() {
    let node = ZStackNode {
      ColorNode("blue")
      TextNode("Overlay")
    }
    XCTAssertEqual(node.type, .zStack)
    XCTAssertEqual(node.attributes[.alignment]?.string, "center")
  }

  func testLazyVStackNode() {
    let node = LazyVStackNode {
      TextNode("Item 1")
      TextNode("Item 2")
    }
    XCTAssertEqual(node.type, .lazyVStack)
    XCTAssertEqual(node.attributes[.alignment]?.string, "center")
  }

  func testLazyVStackNodeWithSpacing() {
    let node = LazyVStackNode(spacing: 15, alignment: .leading) {
      TextNode("Item 1")
    }
    XCTAssertEqual(node.type, .lazyVStack)
    XCTAssertEqual(node.attributes[.spacing]?.float, 15)
    XCTAssertEqual(node.attributes[.alignment]?.string, "leading")
  }

  func testLazyHStackNode() {
    let node = LazyHStackNode {
      TextNode("Item 1")
      TextNode("Item 2")
    }
    XCTAssertEqual(node.type, .lazyHStack)
    XCTAssertEqual(node.attributes[.alignment]?.string, "center")
  }

  func testLazyHStackNodeWithSpacing() {
    let node = LazyHStackNode(spacing: 12, alignment: .top) {
      TextNode("Item 1")
    }
    XCTAssertEqual(node.type, .lazyHStack)
    XCTAssertEqual(node.attributes[.spacing]?.float, 12)
    XCTAssertEqual(node.attributes[.alignment]?.string, "top")
  }

  func testScrollViewNode() {
    let node = ScrollViewNode {
      VStackNode {
        TextNode("Content")
      }
    }
    XCTAssertEqual(node.type, .scrollView)
    XCTAssertEqual(node.attributes[.axis]?.string, "vertical")
    XCTAssertEqual(node.children?.count, 1)
  }

  func testScrollViewNodeHorizontal() {
    let node = ScrollViewNode(axis: .horizontal) {
      HStackNode {
        TextNode("Item")
      }
    }
    XCTAssertEqual(node.type, .scrollView)
    XCTAssertEqual(node.attributes[.axis]?.string, "horizontal")
  }

  func testListNode() {
    let node = ListNode {
      TextNode("Item 1")
      TextNode("Item 2")
    }
    XCTAssertEqual(node.type, .list)
    XCTAssertEqual(node.children?.count, 2)
  }

  func testFormNode() {
    let node = FormNode {
      PickerNode("Fruit", selection: "apple") {
        TextNode("Apple").tag("apple")
      }
      ToggleNode("Dark Mode")
    }
    XCTAssertEqual(node.type, .form)
    XCTAssertEqual(node.children?.count, 2)
  }

  func testDisclosureGroupNode() {
    let node = DisclosureGroupNode("Details") {
      TextNode("Content 1")
      TextNode("Content 2")
    }
    XCTAssertEqual(node.type, .disclosureGroup)
    XCTAssertEqual(node.attributes[.label]?.string, "Details")
    XCTAssertNil(node.attributes[.isExpanded])
    XCTAssertEqual(node.children?.count, 2)
  }

  func testDisclosureGroupNodeWithIsExpanded() {
    let node = DisclosureGroupNode("Settings", isExpanded: true) {
      ToggleNode("Dark Mode")
      SliderNode(value: 0.5)
    }
    XCTAssertEqual(node.type, .disclosureGroup)
    XCTAssertEqual(node.attributes[.label]?.string, "Settings")
    XCTAssertEqual(node.attributes[.isExpanded]?.bool, true)
    XCTAssertEqual(node.children?.count, 2)
  }

  func testGroupBoxNode() {
    let node = GroupBoxNode {
      TextNode("Content 1")
      TextNode("Content 2")
    }
    XCTAssertEqual(node.type, .groupBox)
    XCTAssertNil(node.attributes[.label])
    XCTAssertEqual(node.children?.count, 2)
  }

  func testGroupBoxNodeWithLabel() {
    let node = GroupBoxNode("User Info") {
      TextNode("Name: John")
      TextNode("Age: 30")
    }
    XCTAssertEqual(node.type, .groupBox)
    XCTAssertEqual(node.attributes[.label]?.string, "User Info")
    XCTAssertEqual(node.children?.count, 2)
  }

  func testGroupBoxNodeWithCustomLabel() {
    let label = HStackNode {
      ImageNode(systemName: "star")
      TextNode("Custom")
    }
    let node = GroupBoxNode(label: label) {
      TextNode("Content")
    }
    XCTAssertEqual(node.type, .groupBox)
    XCTAssertEqual(node.attributes[.label]?.node?.type, .hStack)
    XCTAssertEqual(node.children?.count, 1)
  }

  func testControlGroupNode() {
    let node = ControlGroupNode {
      ButtonNode("Bold", onTap: "bold")
      ButtonNode("Italic", onTap: "italic")
      ButtonNode("Underline", onTap: "underline")
    }
    XCTAssertEqual(node.type, .controlGroup)
    XCTAssertEqual(node.children?.count, 3)
    XCTAssertEqual(node.children?[0].type, .button)
    XCTAssertEqual(node.children?[1].type, .button)
    XCTAssertEqual(node.children?[2].type, .button)
  }

  func testTabViewNode() {
    let node = TabViewNode {
      TextNode("Tab 1").tabItem("star", text: "First")
      TextNode("Tab 2").tabItem("heart", text: "Second")
    }
    XCTAssertEqual(node.type, .tabView)
    XCTAssertEqual(node.children?.count, 2)
    XCTAssertNil(node.attributes[.tabViewStyle])
  }

  func testTabViewNodeWithStyle() {
    let node = TabViewNode(style: .page) {
      TextNode("Page 1")
      TextNode("Page 2")
    }
    XCTAssertEqual(node.type, .tabView)
    XCTAssertEqual(node.attributes[.tabViewStyle]?.string, "page")
  }

  func testGridNode() {
    let node = GridNode {
      GridRowNode {
        TextNode("A1")
        TextNode("A2")
      }
      GridRowNode {
        TextNode("B1")
        TextNode("B2")
      }
    }
    XCTAssertEqual(node.type, .grid)
    XCTAssertEqual(node.attributes[.alignment]?.string, "center")
    XCTAssertEqual(node.children?.count, 2)
  }

  func testGridNodeWithSpacing() {
    let node = GridNode(alignment: .topLeading, horizontalSpacing: 10, verticalSpacing: 5) {
      GridRowNode {
        TextNode("Cell")
      }
    }
    XCTAssertEqual(node.type, .grid)
    XCTAssertEqual(node.attributes[.alignment]?.string, "topLeading")
    XCTAssertEqual(node.attributes[.horizontalSpacing]?.float, 10)
    XCTAssertEqual(node.attributes[.verticalSpacing]?.float, 5)
  }

  func testGridRowNode() {
    let node = GridRowNode {
      TextNode("Cell 1")
      TextNode("Cell 2")
    }
    XCTAssertEqual(node.type, .gridRow)
    XCTAssertEqual(node.attributes[.alignment]?.string, "center")
    XCTAssertEqual(node.children?.count, 2)
  }

  func testGridRowNodeWithAlignment() {
    let node = GridRowNode(alignment: .bottom) {
      TextNode("Cell")
    }
    XCTAssertEqual(node.type, .gridRow)
    XCTAssertEqual(node.attributes[.alignment]?.string, "bottom")
  }

  func testLazyVGridNode() {
    let node = LazyVGridNode(columns: 3) {
      TextNode("Item 1")
      TextNode("Item 2")
      TextNode("Item 3")
      TextNode("Item 4")
    }
    XCTAssertEqual(node.type, .lazyVGrid)
    XCTAssertEqual(node.attributes[.columns]?.float, 3)
    XCTAssertEqual(node.attributes[.alignment]?.string, "center")
    XCTAssertEqual(node.children?.count, 4)
  }

  func testLazyVGridNodeWithSpacing() {
    let node = LazyVGridNode(columns: 2, alignment: .leading, spacing: 16) {
      TextNode("A")
      TextNode("B")
    }
    XCTAssertEqual(node.type, .lazyVGrid)
    XCTAssertEqual(node.attributes[.columns]?.float, 2)
    XCTAssertEqual(node.attributes[.alignment]?.string, "leading")
    XCTAssertEqual(node.attributes[.spacing]?.float, 16)
    XCTAssertEqual(node.children?.count, 2)
  }

  func testLazyHGridNode() {
    let node = LazyHGridNode(rows: 2) {
      TextNode("Item 1")
      TextNode("Item 2")
      TextNode("Item 3")
    }
    XCTAssertEqual(node.type, .lazyHGrid)
    XCTAssertEqual(node.attributes[.rows]?.float, 2)
    XCTAssertEqual(node.attributes[.alignment]?.string, "center")
    XCTAssertEqual(node.children?.count, 3)
  }

  func testLazyHGridNodeWithSpacing() {
    let node = LazyHGridNode(rows: 3, alignment: .top, spacing: 12) {
      TextNode("A")
      TextNode("B")
      TextNode("C")
    }
    XCTAssertEqual(node.type, .lazyHGrid)
    XCTAssertEqual(node.attributes[.rows]?.float, 3)
    XCTAssertEqual(node.attributes[.alignment]?.string, "top")
    XCTAssertEqual(node.attributes[.spacing]?.float, 12)
    XCTAssertEqual(node.children?.count, 3)
  }

  func testViewThatFitsNode() {
    let node = ViewThatFitsNode {
      HStackNode {
        TextNode("Wide")
      }
      VStackNode {
        TextNode("Narrow")
      }
    }
    XCTAssertEqual(node.type, .viewThatFits)
    XCTAssertEqual(node.attributes[.axis]?.string, "horizontal")
    XCTAssertEqual(node.children?.count, 2)
  }

  func testViewThatFitsNodeVertical() {
    let node = ViewThatFitsNode(axis: .vertical) {
      TextNode("Option 1")
      TextNode("Option 2")
    }
    XCTAssertEqual(node.type, .viewThatFits)
    XCTAssertEqual(node.attributes[.axis]?.string, "vertical")
  }

  func testCircleNode() {
    let node = CircleNode()
    XCTAssertEqual(node.type, .circle)
  }

  func testRectangleNode() {
    let node = RectangleNode()
    XCTAssertEqual(node.type, .rectangle)
  }

  func testRoundedRectangleNode() {
    let node = RoundedRectangleNode()
    XCTAssertEqual(node.type, .roundedRectangle)
    XCTAssertEqual(node.attributes[.cornerRadius]?.float, 8)
  }

  func testRoundedRectangleNodeCustomRadius() {
    let node = RoundedRectangleNode(cornerRadius: 20)
    XCTAssertEqual(node.type, .roundedRectangle)
    XCTAssertEqual(node.attributes[.cornerRadius]?.float, 20)
  }

  func testUnevenRoundedRectangleNode() {
    let node = UnevenRoundedRectangleNode()
    XCTAssertEqual(node.type, .unevenRoundedRectangle)
    XCTAssertEqual(node.attributes[.topLeading]?.float, 0)
    XCTAssertEqual(node.attributes[.bottomLeading]?.float, 0)
    XCTAssertEqual(node.attributes[.bottomTrailing]?.float, 0)
    XCTAssertEqual(node.attributes[.topTrailing]?.float, 0)
  }

  func testUnevenRoundedRectangleNodeCustomRadii() {
    let node = UnevenRoundedRectangleNode(
      topLeading: 30,
      bottomLeading: 10,
      bottomTrailing: 30,
      topTrailing: 10
    )
    XCTAssertEqual(node.type, .unevenRoundedRectangle)
    XCTAssertEqual(node.attributes[.topLeading]?.float, 30)
    XCTAssertEqual(node.attributes[.bottomLeading]?.float, 10)
    XCTAssertEqual(node.attributes[.bottomTrailing]?.float, 30)
    XCTAssertEqual(node.attributes[.topTrailing]?.float, 10)
  }

  func testCapsuleNode() {
    let node = CapsuleNode()
    XCTAssertEqual(node.type, .capsule)
  }

  func testEllipseNode() {
    let node = EllipseNode()
    XCTAssertEqual(node.type, .ellipse)
  }

  func testContainerRelativeShapeNode() {
    let node = ContainerRelativeShapeNode()
    XCTAssertEqual(node.type, .containerRelativeShape)
  }

  func testLinearGradientNode() {
    let node = LinearGradientNode(colors: ["#FF0000", "#0000FF"])
    XCTAssertEqual(node.type, .linearGradient)
    let colors = node.attributes[.colors]?.array?.compactMap { $0.string }
    XCTAssertEqual(colors?.count, 2)
    XCTAssertEqual(colors?[0], "#FF0000")
    XCTAssertEqual(colors?[1], "#0000FF")
    XCTAssertEqual(node.attributes[.startPoint]?.string, "top")
    XCTAssertEqual(node.attributes[.endPoint]?.string, "bottom")
  }

  func testLinearGradientNodeCustomPoints() {
    let node = LinearGradientNode(
      colors: ["red", "blue"],
      startPoint: .leading,
      endPoint: .trailing
    )
    XCTAssertEqual(node.type, .linearGradient)
    XCTAssertEqual(node.attributes[.startPoint]?.string, "leading")
    XCTAssertEqual(node.attributes[.endPoint]?.string, "trailing")
  }

  func testRadialGradientNode() {
    let node = RadialGradientNode(colors: ["#FF0000", "#0000FF"])
    XCTAssertEqual(node.type, .radialGradient)
    let colors = node.attributes[.colors]?.array?.compactMap { $0.string }
    XCTAssertEqual(colors?.count, 2)
    XCTAssertEqual(node.attributes[.center]?.string, "center")
    XCTAssertEqual(node.attributes[.startRadius]?.float, 0)
    XCTAssertEqual(node.attributes[.endRadius]?.float, 300)
  }

  func testRadialGradientNodeCustom() {
    let node = RadialGradientNode(
      colors: ["red", "blue"],
      center: .topLeading,
      startRadius: 10,
      endRadius: 200
    )
    XCTAssertEqual(node.type, .radialGradient)
    XCTAssertEqual(node.attributes[.center]?.string, "topLeading")
    XCTAssertEqual(node.attributes[.startRadius]?.float, 10)
    XCTAssertEqual(node.attributes[.endRadius]?.float, 200)
  }

  func testAngularGradientNode() {
    let node = AngularGradientNode(colors: ["#FF0000", "#0000FF"])
    XCTAssertEqual(node.type, .angularGradient)
    let colors = node.attributes[.colors]?.array?.compactMap { $0.string }
    XCTAssertEqual(colors?.count, 2)
    XCTAssertEqual(node.attributes[.center]?.string, "center")
    XCTAssertEqual(node.attributes[.startAngle]?.float, 0)
    XCTAssertEqual(node.attributes[.endAngle]?.float, 360)
  }

  func testAngularGradientNodeCustom() {
    let node = AngularGradientNode(
      colors: ["red", "blue", "green"],
      center: .bottom,
      startAngle: 45,
      endAngle: 315
    )
    XCTAssertEqual(node.type, .angularGradient)
    let colors = node.attributes[.colors]?.array?.compactMap { $0.string }
    XCTAssertEqual(colors?.count, 3)
    XCTAssertEqual(node.attributes[.center]?.string, "bottom")
    XCTAssertEqual(node.attributes[.startAngle]?.float, 45)
    XCTAssertEqual(node.attributes[.endAngle]?.float, 315)
  }

  func testLinearGradientNodeWithColorStops() {
    let node = LinearGradientNode(
      colorStops: [
        ("#FF0000", 0.0),
        ("#0000FF", 0.8),
        ("#FFFFFF", 1.0),
      ]
    )
    XCTAssertEqual(node.type, .linearGradient)
    XCTAssertNil(node.attributes[.colors])
    XCTAssertNotNil(node.attributes[.colorStops])

    let stops = node.attributes[.colorStops]?.array
    XCTAssertEqual(stops?.count, 3)

    let firstStop = stops?[0].dict
    XCTAssertEqual(firstStop?[.color]?.string, "#FF0000")
    XCTAssertEqual(firstStop?[.location]?.float, 0.0)

    let secondStop = stops?[1].dict
    XCTAssertEqual(secondStop?[.color]?.string, "#0000FF")
    XCTAssertEqual(secondStop?[.location]?.float, 0.8)

    let thirdStop = stops?[2].dict
    XCTAssertEqual(thirdStop?[.color]?.string, "#FFFFFF")
    XCTAssertEqual(thirdStop?[.location]?.float, 1.0)

    XCTAssertEqual(node.attributes[.startPoint]?.string, "top")
    XCTAssertEqual(node.attributes[.endPoint]?.string, "bottom")
  }

  func testRadialGradientNodeWithColorStops() {
    let node = RadialGradientNode(
      colorStops: [
        ("#FF0000", 0.0),
        ("#00FF00", 0.5),
        ("#0000FF", 1.0),
      ],
      center: .topLeading,
      endRadius: 500
    )
    XCTAssertEqual(node.type, .radialGradient)
    XCTAssertNil(node.attributes[.colors])
    XCTAssertNotNil(node.attributes[.colorStops])

    let stops = node.attributes[.colorStops]?.array
    XCTAssertEqual(stops?.count, 3)

    let firstStop = stops?[0].dict
    XCTAssertEqual(firstStop?[.color]?.string, "#FF0000")
    XCTAssertEqual(firstStop?[.location]?.float, 0.0)

    XCTAssertEqual(node.attributes[.center]?.string, "topLeading")
    XCTAssertEqual(node.attributes[.startRadius]?.float, 0)
    XCTAssertEqual(node.attributes[.endRadius]?.float, 500)
  }

  func testAngularGradientNodeWithColorStops() {
    let node = AngularGradientNode(
      colorStops: [
        ("#FF0000", 0.0),
        ("#00FF00", 0.33),
        ("#0000FF", 0.66),
        ("#FF0000", 1.0),
      ],
      center: .center,
      startAngle: 0,
      endAngle: 360
    )
    XCTAssertEqual(node.type, .angularGradient)
    XCTAssertNil(node.attributes[.colors])
    XCTAssertNotNil(node.attributes[.colorStops])

    let stops = node.attributes[.colorStops]?.array
    XCTAssertEqual(stops?.count, 4)

    let secondStop = stops?[1].dict
    XCTAssertEqual(secondStop?[.color]?.string, "#00FF00")
    XCTAssertEqual(secondStop?[.location]?.float, 0.33)

    XCTAssertEqual(node.attributes[.center]?.string, "center")
    XCTAssertEqual(node.attributes[.startAngle]?.float, 0)
    XCTAssertEqual(node.attributes[.endAngle]?.float, 360)
  }

  func testSpacerNode() {
    let node = SpacerNode()
    XCTAssertEqual(node.type, .spacer)
  }

  func testDividerNode() {
    let node = DividerNode()
    XCTAssertEqual(node.type, .divider)
  }

  func testEmptyViewNode() {
    let node = EmptyViewNode()
    XCTAssertEqual(node.type, .emptyView)
  }

  func testMenuNodeWithStringLabel() {
    let node = MenuNode("Options") {
      ButtonNode("Action 1", onTap: "action1")
      ButtonNode("Action 2", onTap: "action2")
    }
    XCTAssertEqual(node.type, .menu)
    XCTAssertEqual(node.attributes[.label]?.string, "Options")
    XCTAssertEqual(node.children?.count, 2)
    XCTAssertEqual(node.children?[0].type, .button)
    XCTAssertEqual(node.children?[1].type, .button)
  }

  func testMenuNodeWithNodeLabel() {
    let node = MenuNode(label: LabelNode("Settings", systemImage: "gear")) {
      ButtonNode("Profile", onTap: "profile")
      ButtonNode("Logout", onTap: "logout")
    }
    XCTAssertEqual(node.type, .menu)
    XCTAssertEqual(node.attributes[.label]?.node?.type, .label)
    XCTAssertEqual(node.attributes[.label]?.node?.attributes[.title]?.string, "Settings")
    XCTAssertEqual(node.children?.count, 2)
  }

  func testProgressViewNodeIndeterminate() {
    let node = ProgressViewNode()
    XCTAssertEqual(node.type, .progressView)
    XCTAssertNil(node.attributes[.label])
    XCTAssertNil(node.attributes[.value])
  }

  func testProgressViewNodeIndeterminateWithLabel() {
    let node = ProgressViewNode(label: "Loading...")
    XCTAssertEqual(node.type, .progressView)
    XCTAssertEqual(node.attributes[.label]?.string, "Loading...")
  }

  func testProgressViewNodeDeterminate() {
    let node = ProgressViewNode(value: 0.5)
    XCTAssertEqual(node.type, .progressView)
    XCTAssertEqual(node.attributes[.value]?.float, 0.5)
    XCTAssertEqual(node.attributes[.total]?.float, 1.0)
  }

  func testProgressViewNodeDeterminateWithTotal() {
    let node = ProgressViewNode(label: "Uploading", value: 75, total: 100)
    XCTAssertEqual(node.type, .progressView)
    XCTAssertEqual(node.attributes[.label]?.string, "Uploading")
    XCTAssertEqual(node.attributes[.value]?.float, 75)
    XCTAssertEqual(node.attributes[.total]?.float, 100)
  }

  func testGaugeNode() {
    let node = GaugeNode("Speed", value: 0.7)
    XCTAssertEqual(node.type, .gauge)
    XCTAssertEqual(node.attributes[.label]?.string, "Speed")
    XCTAssertEqual(node.attributes[.value]?.float, 0.7)
    XCTAssertEqual(node.attributes[.minimumValue]?.float, 0)
    XCTAssertEqual(node.attributes[.maximumValue]?.float, 1)
  }

  func testGaugeNodeWithCustomRange() {
    let node = GaugeNode("Temperature", value: 75, minimumValue: 0, maximumValue: 100)
    XCTAssertEqual(node.type, .gauge)
    XCTAssertEqual(node.attributes[.label]?.string, "Temperature")
    XCTAssertEqual(node.attributes[.value]?.float, 75)
    XCTAssertEqual(node.attributes[.minimumValue]?.float, 0)
    XCTAssertEqual(node.attributes[.maximumValue]?.float, 100)
  }

  func testGaugeNodeWithCustomLabel() {
    let node = GaugeNode(value: 0.5) {
      TextNode("Speed").foregroundColor("blue")
    }
    XCTAssertEqual(node.type, .gauge)
    XCTAssertNotNil(node.attributes[.label]?.node)
    XCTAssertEqual(node.attributes[.label]?.node?.type, .text)
    XCTAssertEqual(node.attributes[.value]?.float, 0.5)
    XCTAssertEqual(node.attributes[.minimumValue]?.float, 0)
    XCTAssertEqual(node.attributes[.maximumValue]?.float, 1)
  }

  func testNavigationStackNode() {
    let node = NavigationStackNode {
      VStackNode {
        TextNode("Home")
        TextNode("Content")
      }
    }
    XCTAssertEqual(node.type, .navigationStack)
    XCTAssertEqual(node.children?.count, 1)
  }

  func testNavigationStackNodeWithMultipleChildren() {
    let node = NavigationStackNode {
      TextNode("Title")
      ListNode {
        TextNode("Item 1")
        TextNode("Item 2")
      }
    }
    XCTAssertEqual(node.type, .navigationStack)
    XCTAssertEqual(node.children?.count, 2)
  }

  func testNavigationLinkNodeWithTextLabel() {
    let node = NavigationLinkNode("Settings", value: "settings")
    XCTAssertEqual(node.type, .navigationLink)
    XCTAssertEqual(node.attributes[.value]?.string, "settings")
    XCTAssertEqual(node.children?.count, 1)
    XCTAssertEqual(node.children?.first?.type, .text)
  }

  func testNavigationLinkNodeWithSingleNode() {
    let label = HStackNode {
      ImageNode(systemName: "gear")
      TextNode("Settings")
    }
    let node = NavigationLinkNode(value: "settings", label: label)
    XCTAssertEqual(node.type, .navigationLink)
    XCTAssertEqual(node.attributes[.value]?.string, "settings")
    XCTAssertEqual(node.children?.count, 1)
    XCTAssertEqual(node.children?.first?.type, .hStack)
  }

  func testNavigationLinkNodeWithBuilder() {
    let node = NavigationLinkNode(value: "detail") {
      ImageNode(systemName: "star")
      TextNode("Favorite")
    }
    XCTAssertEqual(node.type, .navigationLink)
    XCTAssertEqual(node.attributes[.value]?.string, "detail")
    XCTAssertEqual(node.children?.count, 2)
  }

  func testWebViewNodeURL() {
    let node = WebViewNode(url: "https://example.com")
    XCTAssertEqual(node.type, .webView)
    XCTAssertEqual(node.attributes[.url]?.string, "https://example.com")
    XCTAssertNil(node.attributes[.html])
  }

  func testWebViewNodeURLWithHTML() {
    let node = WebViewNode(url: "https://example.com", html: "<p>Fallback</p>")
    XCTAssertEqual(node.type, .webView)
    XCTAssertEqual(node.attributes[.url]?.string, "https://example.com")
    XCTAssertEqual(node.attributes[.html]?.string, "<p>Fallback</p>")
  }

  func testColorSchemeNode() {
    let node = ColorSchemeNode {
      TextNode("Light content")
      TextNode("Dark content")
    }
    XCTAssertEqual(node.type, .colorScheme)
    XCTAssertEqual(node.children?.count, 2)
  }

  func testForEachNodeArray() {
    let items = ["Apple", "Banana", "Cherry"]
    let nodes = ForEachNode(items) { item in
      TextNode(item)
    }
    XCTAssertEqual(nodes.count, 3)
    XCTAssertEqual(nodes[0].attributes[.text]?.string, "Apple")
    XCTAssertEqual(nodes[1].attributes[.text]?.string, "Banana")
    XCTAssertEqual(nodes[2].attributes[.text]?.string, "Cherry")
  }

  func testForEachNodeArrayWithIndex() {
    let items = ["First", "Second"]
    let nodes = ForEachNode(items) { index, item in
      TextNode("\(index): \(item)")
    }
    XCTAssertEqual(nodes.count, 2)
    XCTAssertEqual(nodes[0].attributes[.text]?.string, "0: First")
    XCTAssertEqual(nodes[1].attributes[.text]?.string, "1: Second")
  }

  func testForEachNodeRange() {
    let nodes = ForEachNode(0..<3) { i in
      TextNode("Item \(i)")
    }
    XCTAssertEqual(nodes.count, 3)
    XCTAssertEqual(nodes[0].attributes[.text]?.string, "Item 0")
    XCTAssertEqual(nodes[1].attributes[.text]?.string, "Item 1")
    XCTAssertEqual(nodes[2].attributes[.text]?.string, "Item 2")
  }

  func testForEachNodeClosedRange() {
    let nodes = ForEachNode(1...3) { i in
      TextNode("Number \(i)")
    }
    XCTAssertEqual(nodes.count, 3)
    XCTAssertEqual(nodes[0].attributes[.text]?.string, "Number 1")
    XCTAssertEqual(nodes[1].attributes[.text]?.string, "Number 2")
    XCTAssertEqual(nodes[2].attributes[.text]?.string, "Number 3")
  }

  func testGroupNode() {
    let node = GroupNode {
      TextNode("Item 1")
      TextNode("Item 2")
      TextNode("Item 3")
    }
    XCTAssertEqual(node.type, .group)
    XCTAssertEqual(node.children?.count, 3)
    XCTAssertEqual(node.children?[0].attributes[.text]?.string, "Item 1")
    XCTAssertEqual(node.children?[1].attributes[.text]?.string, "Item 2")
    XCTAssertEqual(node.children?[2].attributes[.text]?.string, "Item 3")
  }

  func testSectionNode() {
    let node = SectionNode {
      TextNode("Item 1")
      TextNode("Item 2")
    }
    XCTAssertEqual(node.type, .section)
    XCTAssertNil(node.attributes[.header])
    XCTAssertNil(node.attributes[.footer])
    XCTAssertEqual(node.children?.count, 2)
  }

  func testSectionNodeWithHeader() {
    let node = SectionNode(header: TextNode("Header")) {
      TextNode("Item 1")
      TextNode("Item 2")
    }
    XCTAssertEqual(node.type, .section)
    XCTAssertEqual(node.attributes[.header]?.node?.attributes[.text]?.string, "Header")
    XCTAssertNil(node.attributes[.footer])
    XCTAssertEqual(node.children?.count, 2)
  }

  func testSectionNodeWithFooter() {
    let node = SectionNode(footer: TextNode("Footer")) {
      TextNode("Item 1")
    }
    XCTAssertEqual(node.type, .section)
    XCTAssertNil(node.attributes[.header])
    XCTAssertEqual(node.attributes[.footer]?.node?.attributes[.text]?.string, "Footer")
    XCTAssertEqual(node.children?.count, 1)
  }

  func testSectionNodeWithHeaderAndFooter() {
    let node = SectionNode(header: TextNode("Header"), footer: TextNode("Footer")) {
      TextNode("Item 1")
      TextNode("Item 2")
      TextNode("Item 3")
    }
    XCTAssertEqual(node.type, .section)
    XCTAssertEqual(node.attributes[.header]?.node?.attributes[.text]?.string, "Header")
    XCTAssertEqual(node.attributes[.footer]?.node?.attributes[.text]?.string, "Footer")
    XCTAssertEqual(node.children?.count, 3)
  }
}
