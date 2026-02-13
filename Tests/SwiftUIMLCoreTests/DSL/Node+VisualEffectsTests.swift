import XCTest
@testable import SwiftUIMLCore

final class NodeVisualEffectsTests: XCTestCase {
  func testOpacity() {
    let node = TextNode("Test").opacity(0.5)
    XCTAssertEqual(node.attributes[.opacity]?.float, 0.5)
  }

  func testOpacityFull() {
    let node = TextNode("Test").opacity(1.0)
    XCTAssertEqual(node.attributes[.opacity]?.float, 1.0)
  }

  func testOpacityHidden() {
    let node = TextNode("Test").opacity(0.0)
    XCTAssertEqual(node.attributes[.opacity]?.float, 0.0)
  }

  func testCornerRadius() {
    let node = TextNode("Test").cornerRadius(10)
    XCTAssertEqual(node.attributes[.cornerRadius]?.float, 10)
  }

  func testHidden() {
    let node = TextNode("Test").hidden()
    XCTAssertEqual(node.attributes[.hidden]?.bool, true)
  }

  func testClipped() {
    let node = TextNode("Test").clipped()
    XCTAssertEqual(node.attributes[.clipped]?.bool, true)
  }

  func testIgnoresSafeAreaAll() {
    let node = TextNode("Test").ignoresSafeArea()
    XCTAssertEqual(node.attributes[.ignoresSafeArea]?.bool, true)
  }

  func testIgnoresSafeAreaEdges() {
    let node = TextNode("Test").ignoresSafeArea(.top)
    XCTAssertEqual(node.attributes[.ignoresSafeArea]?.string, "top")
  }

  func testBorder() {
    let node = TextNode("Test").border("#FF0000", width: 2)

    let dict = node.attributes[.border]?.dict
    XCTAssertEqual(dict?[.color]?.string, "#FF0000")
    XCTAssertEqual(dict?[.width]?.float, 2)
  }

  func testShadowDefaults() {
    let node = TextNode("Test").shadow(color: "#000000")

    let dict = node.attributes[.shadow]?.dict
    XCTAssertEqual(dict?[.color]?.string, "#000000")
    XCTAssertEqual(dict?[.radius]?.float, 5)
    XCTAssertEqual(dict?[.x]?.float, 0)
    XCTAssertEqual(dict?[.y]?.float, 0)
  }

  func testShadowCustom() {
    let node = TextNode("Test").shadow(color: "#FF0000", radius: 10, x: 5, y: 5)

    let dict = node.attributes[.shadow]?.dict
    XCTAssertEqual(dict?[.color]?.string, "#FF0000")
    XCTAssertEqual(dict?[.radius]?.float, 10)
    XCTAssertEqual(dict?[.x]?.float, 5)
    XCTAssertEqual(dict?[.y]?.float, 5)
  }

  func testBlurSimple() {
    let node = TextNode("Test").blur(5)
    XCTAssertEqual(node.attributes[.blur]?.float, 5)
  }

  func testBlurWithOpaque() {
    let node = TextNode("Test").blur(10, opaque: true)

    let dict = node.attributes[.blur]?.dict
    XCTAssertEqual(dict?[.radius]?.float, 10)
    XCTAssertEqual(dict?[.opaque]?.bool, true)
  }

  func testBlurWithOpaqueDisabled() {
    let node = TextNode("Test").blur(10, opaque: false)

    let dict = node.attributes[.blur]?.dict
    XCTAssertEqual(dict?[.radius]?.float, 10)
    XCTAssertEqual(dict?[.opaque]?.bool, false)
  }

  func testBrightness() {
    let node = TextNode("Test").brightness(0.5)
    XCTAssertEqual(node.attributes[.brightness]?.float, 0.5)
  }

  func testBrightnessNegative() {
    let node = TextNode("Test").brightness(-0.3)
    XCTAssertEqual(node.attributes[.brightness]?.float, -0.3)
  }

  func testBrightnessChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .brightness(0.2)
    .padding(20)

    XCTAssertEqual(node.attributes[.brightness]?.float, 0.2)
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testContrast() {
    let node = TextNode("Test").contrast(1.5)
    XCTAssertEqual(node.attributes[.contrast]?.float, 1.5)
  }

  func testContrastLow() {
    let node = TextNode("Test").contrast(0.5)
    XCTAssertEqual(node.attributes[.contrast]?.float, 0.5)
  }

  func testContrastChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .contrast(2.0)
    .padding(20)

    XCTAssertEqual(node.attributes[.contrast]?.float, 2.0)
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testSaturation() {
    let node = TextNode("Test").saturation(1.5)
    XCTAssertEqual(node.attributes[.saturation]?.float, 1.5)
  }

  func testSaturationGrayscale() {
    let node = TextNode("Test").saturation(0.0)
    XCTAssertEqual(node.attributes[.saturation]?.float, 0.0)
  }

  func testSaturationChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .saturation(2.0)
    .padding(20)

    XCTAssertEqual(node.attributes[.saturation]?.float, 2.0)
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testGrayscale() {
    let node = TextNode("Test").grayscale(0.5)
    XCTAssertEqual(node.attributes[.grayscale]?.float, 0.5)
  }

  func testGrayscaleFull() {
    let node = TextNode("Test").grayscale(1.0)
    XCTAssertEqual(node.attributes[.grayscale]?.float, 1.0)
  }

  func testGrayscaleChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .grayscale(0.8)
    .padding(20)

    XCTAssertEqual(node.attributes[.grayscale]?.float, 0.8)
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testHueRotation() {
    let node = TextNode("Test").hueRotation(.degrees(90))
    let dict = node.attributes[.hueRotation]?.dict
    XCTAssertEqual(dict?[.degrees]?.float, 90)
  }

  func testHueRotation180() {
    let node = TextNode("Test").hueRotation(.degrees(180))
    let dict = node.attributes[.hueRotation]?.dict
    XCTAssertEqual(dict?[.degrees]?.float, 180)
  }

  func testHueRotationChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .hueRotation(.degrees(45))
    .padding(20)

    let dict = node.attributes[.hueRotation]?.dict
    XCTAssertEqual(dict?[.degrees]?.float, 45)
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testHueRotationRadians() {
    let node = TextNode("Test").hueRotation(.radians(1.57))
    let dict = node.attributes[.hueRotation]?.dict
    XCTAssertEqual(dict?[.radians]?.float, 1.57)
  }

  func testHueRotationZero() {
    let node = TextNode("Test").hueRotation(Node.Angle.zero)
    let dict = node.attributes[.hueRotation]?.dict
    XCTAssertEqual(dict?[.zero]?.bool, true)
  }

  func testColorInvert() {
    let node = TextNode("Test").colorInvert()
    XCTAssertEqual(node.attributes[.colorInvert]?.bool, true)
  }

  func testColorInvertChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .colorInvert()
    .padding(20)

    XCTAssertEqual(node.attributes[.colorInvert]?.bool, true)
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testLuminanceToAlpha() {
    let node = TextNode("Test").luminanceToAlpha()
    XCTAssertEqual(node.attributes[.luminanceToAlpha]?.bool, true)
  }

  func testLuminanceToAlphaChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .luminanceToAlpha()
    .padding(20)

    XCTAssertEqual(node.attributes[.luminanceToAlpha]?.bool, true)
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testColorMultiply() {
    let node = TextNode("Test").colorMultiply("#FF0000")
    XCTAssertEqual(node.attributes[.colorMultiply]?.string, "#FF0000")
  }

  func testColorMultiplyChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .colorMultiply("#00FF00")
    .padding(20)

    XCTAssertEqual(node.attributes[.colorMultiply]?.string, "#00FF00")
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testTextFieldStyleAutomatic() {
    let node = TextNode("Test").textFieldStyle(.automatic)
    XCTAssertEqual(node.attributes[.textFieldStyle]?.string, "automatic")
  }

  func testTextFieldStylePlain() {
    let node = TextNode("Test").textFieldStyle(.plain)
    XCTAssertEqual(node.attributes[.textFieldStyle]?.string, "plain")
  }

  func testTextFieldStyleRoundedBorder() {
    let node = TextNode("Test").textFieldStyle(.roundedBorder)
    XCTAssertEqual(node.attributes[.textFieldStyle]?.string, "roundedBorder")
  }

  func testButtonStyleAutomatic() {
    let node = TextNode("Test").buttonStyle(.automatic)
    XCTAssertEqual(node.attributes[.buttonStyle]?.string, "automatic")
  }

  func testButtonStylePlain() {
    let node = TextNode("Test").buttonStyle(.plain)
    XCTAssertEqual(node.attributes[.buttonStyle]?.string, "plain")
  }

  func testButtonStyleBordered() {
    let node = TextNode("Test").buttonStyle(.bordered)
    XCTAssertEqual(node.attributes[.buttonStyle]?.string, "bordered")
  }

  func testButtonStyleBorderedProminent() {
    let node = TextNode("Test").buttonStyle(.borderedProminent)
    XCTAssertEqual(node.attributes[.buttonStyle]?.string, "borderedProminent")
  }

  func testButtonStyleBorderless() {
    let node = TextNode("Test").buttonStyle(.borderless)
    XCTAssertEqual(node.attributes[.buttonStyle]?.string, "borderless")
  }

  func testProgressViewStyleAutomatic() {
    let node = TextNode("Test").progressViewStyle(.automatic)
    XCTAssertEqual(node.attributes[.progressViewStyle]?.string, "automatic")
  }

  func testProgressViewStyleLinear() {
    let node = TextNode("Test").progressViewStyle(.linear)
    XCTAssertEqual(node.attributes[.progressViewStyle]?.string, "linear")
  }

  func testProgressViewStyleCircular() {
    let node = TextNode("Test").progressViewStyle(.circular)
    XCTAssertEqual(node.attributes[.progressViewStyle]?.string, "circular")
  }

  func testListStyleAutomatic() {
    let node = ListNode {}.listStyle(.automatic)
    XCTAssertEqual(node.attributes[.listStyle]?.string, "automatic")
  }

  func testListStylePlain() {
    let node = ListNode {}.listStyle(.plain)
    XCTAssertEqual(node.attributes[.listStyle]?.string, "plain")
  }

  func testListStyleGrouped() {
    let node = ListNode {}.listStyle(.grouped)
    XCTAssertEqual(node.attributes[.listStyle]?.string, "grouped")
  }

  func testListStyleInset() {
    let node = ListNode {}.listStyle(.inset)
    XCTAssertEqual(node.attributes[.listStyle]?.string, "inset")
  }

  func testListStyleInsetGrouped() {
    let node = ListNode {}.listStyle(.insetGrouped)
    XCTAssertEqual(node.attributes[.listStyle]?.string, "insetGrouped")
  }

  func testListStyleSidebar() {
    let node = ListNode {}.listStyle(.sidebar)
    XCTAssertEqual(node.attributes[.listStyle]?.string, "sidebar")
  }

  func testToggleStyleAutomatic() {
    let node = ToggleNode("Test").toggleStyle(.automatic)
    XCTAssertEqual(node.attributes[.toggleStyle]?.string, "automatic")
  }

  func testToggleStyleSwitch() {
    let node = ToggleNode("Test").toggleStyle(.switch)
    XCTAssertEqual(node.attributes[.toggleStyle]?.string, "switch")
  }

  func testToggleStyleButton() {
    let node = ToggleNode("Test").toggleStyle(.button)
    XCTAssertEqual(node.attributes[.toggleStyle]?.string, "button")
  }

  func testPickerStyleAutomatic() {
    let node = PickerNode("Test", selection: "a") {}.pickerStyle(.automatic)
    XCTAssertEqual(node.attributes[.pickerStyle]?.string, "automatic")
  }

  func testPickerStyleInline() {
    let node = PickerNode("Test", selection: "a") {}.pickerStyle(.inline)
    XCTAssertEqual(node.attributes[.pickerStyle]?.string, "inline")
  }

  func testPickerStyleMenu() {
    let node = PickerNode("Test", selection: "a") {}.pickerStyle(.menu)
    XCTAssertEqual(node.attributes[.pickerStyle]?.string, "menu")
  }

  func testPickerStyleNavigationLink() {
    let node = PickerNode("Test", selection: "a") {}.pickerStyle(.navigationLink)
    XCTAssertEqual(node.attributes[.pickerStyle]?.string, "navigationLink")
  }

  func testPickerStylePalette() {
    let node = PickerNode("Test", selection: "a") {}.pickerStyle(.palette)
    XCTAssertEqual(node.attributes[.pickerStyle]?.string, "palette")
  }

  func testPickerStyleSegmented() {
    let node = PickerNode("Test", selection: "a") {}.pickerStyle(.segmented)
    XCTAssertEqual(node.attributes[.pickerStyle]?.string, "segmented")
  }

  func testPickerStyleWheel() {
    let node = PickerNode("Test", selection: "a") {}.pickerStyle(.wheel)
    XCTAssertEqual(node.attributes[.pickerStyle]?.string, "wheel")
  }

  func testLabelsHidden() {
    let node = TextNode("Test").labelsHidden()
    XCTAssertEqual(node.attributes[.labelsHidden]?.bool, true)
  }

  func testButtonBorderShapeAutomatic() {
    let node = TextNode("Test").buttonBorderShape(.automatic)
    XCTAssertEqual(node.attributes[.buttonBorderShape]?.string, "automatic")
  }

  func testButtonBorderShapeCapsule() {
    let node = TextNode("Test").buttonBorderShape(.capsule)
    XCTAssertEqual(node.attributes[.buttonBorderShape]?.string, "capsule")
  }

  func testButtonBorderShapeRoundedRectangle() {
    let node = TextNode("Test").buttonBorderShape(.roundedRectangle)
    XCTAssertEqual(node.attributes[.buttonBorderShape]?.string, "roundedRectangle")
  }

  func testRedactedPlaceholder() {
    let node = TextNode("Test").redacted(reason: .placeholder)
    XCTAssertEqual(node.attributes[.redacted]?.string, "placeholder")
  }

  func testRedactedPrivacy() {
    let node = TextNode("Test").redacted(reason: .privacy)
    XCTAssertEqual(node.attributes[.redacted]?.string, "privacy")
  }

  func testRedactedChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .redacted(reason: .placeholder)
    .padding(20)

    XCTAssertEqual(node.attributes[.redacted]?.string, "placeholder")
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testPrivacySensitiveDefault() {
    let node = TextNode("Test").privacySensitive()
    XCTAssertEqual(node.attributes[.privacySensitive]?.bool, true)
  }

  func testPrivacySensitiveTrue() {
    let node = TextNode("Test").privacySensitive(true)
    XCTAssertEqual(node.attributes[.privacySensitive]?.bool, true)
  }

  func testPrivacySensitiveFalse() {
    let node = TextNode("Test").privacySensitive(false)
    XCTAssertEqual(node.attributes[.privacySensitive]?.bool, false)
  }

  func testPrivacySensitiveChaining() {
    let node = VStackNode {
      TextNode("Content")
    }
    .privacySensitive()
    .padding(20)

    XCTAssertEqual(node.attributes[.privacySensitive]?.bool, true)
    XCTAssertEqual(node.attributes[.padding]?.cgFloat, 20)
  }

  func testRedactedAndPrivacySensitiveTogether() {
    let node = TextNode("Test")
      .redacted(reason: .privacy)
      .privacySensitive()

    XCTAssertEqual(node.attributes[.redacted]?.string, "privacy")
    XCTAssertEqual(node.attributes[.privacySensitive]?.bool, true)
  }
}
