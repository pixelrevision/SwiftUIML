import XCTest
import SwiftUI
@testable import SwiftUIML

final class BlendModeParsingTests: XCTestCase {
  func testParseNormal() {
    let mode = SwiftUI.BlendMode("normal")
    XCTAssertEqual(mode, .normal)
  }

  func testParseMultiply() {
    let mode = SwiftUI.BlendMode("multiply")
    XCTAssertEqual(mode, .multiply)
  }

  func testParseScreen() {
    let mode = SwiftUI.BlendMode("screen")
    XCTAssertEqual(mode, .screen)
  }

  func testParseOverlay() {
    let mode = SwiftUI.BlendMode("overlay")
    XCTAssertEqual(mode, .overlay)
  }

  func testParseDarken() {
    let mode = SwiftUI.BlendMode("darken")
    XCTAssertEqual(mode, .darken)
  }

  func testParseLighten() {
    let mode = SwiftUI.BlendMode("lighten")
    XCTAssertEqual(mode, .lighten)
  }

  func testParseColorDodge() {
    let mode = SwiftUI.BlendMode("colorDodge")
    XCTAssertEqual(mode, .colorDodge)
  }

  func testParseHue() {
    let mode = SwiftUI.BlendMode("hue")
    XCTAssertEqual(mode, .hue)
  }

  func testParseSaturation() {
    let mode = SwiftUI.BlendMode("saturation")
    XCTAssertEqual(mode, .saturation)
  }

  func testParseDifference() {
    let mode = SwiftUI.BlendMode("difference")
    XCTAssertEqual(mode, .difference)
  }

  func testParseInvalidReturnsNil() {
    let mode = SwiftUI.BlendMode("invalid")
    XCTAssertNil(mode)
  }
}
