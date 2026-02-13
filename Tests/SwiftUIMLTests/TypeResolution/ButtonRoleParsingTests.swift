import XCTest
import SwiftUI
@testable import SwiftUIML

final class ButtonRoleParsingTests: XCTestCase {
  func testButtonRoleCancel() {
    let result = ButtonRole("cancel")
    XCTAssertEqual(result, .cancel)
  }

  func testButtonRoleDestructive() {
    let result = ButtonRole("destructive")
    XCTAssertEqual(result, .destructive)
  }

  func testButtonRoleNil() {
    let result = ButtonRole(nil)
    XCTAssertNil(result)
  }

  func testButtonRoleInvalid() {
    let result = ButtonRole("invalid")
    XCTAssertNil(result)
  }
}
