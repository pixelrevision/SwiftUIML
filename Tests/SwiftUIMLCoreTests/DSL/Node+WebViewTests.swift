import XCTest
@testable import SwiftUIMLCore

final class NodeWebViewTests: XCTestCase {
  func testJavascriptBridgeBasic() {
    let node = WebViewNode(url: "https://example.com")
      .javascriptBridge(allowlist: ["example.com"])

    let dict = node.attributes[.javascriptBridge]?.dict
    XCTAssertEqual(dict?[.enabled]?.bool, true)
    XCTAssertEqual(dict?[.allowlist]?.array?.first?.string, "example.com")
    XCTAssertEqual(dict?[.mainFrameOnly]?.bool, true)
  }

  func testJavascriptBridgeDisabled() {
    let node = WebViewNode(url: "https://example.com")
      .javascriptBridge(enabled: false, allowlist: ["example.com"])

    let dict = node.attributes[.javascriptBridge]?.dict
    XCTAssertEqual(dict?[.enabled]?.bool, false)
  }

  func testJavascriptBridgeWithScriptInjectionTime() {
    let node = WebViewNode(url: "https://example.com")
      .javascriptBridge(allowlist: ["example.com"], scriptInjectionTime: .atDocumentEnd)

    let dict = node.attributes[.javascriptBridge]?.dict
    XCTAssertEqual(dict?[.injectionTime]?.string, "atDocumentEnd")
  }

  func testJavascriptBridgeWithScriptInjectionTimeStart() {
    let node = WebViewNode(url: "https://example.com")
      .javascriptBridge(allowlist: ["example.com"], scriptInjectionTime: .atDocumentStart)

    let dict = node.attributes[.javascriptBridge]?.dict
    XCTAssertEqual(dict?[.injectionTime]?.string, "atDocumentStart")
  }

  func testJavascriptBridgeMainFrameOnlyFalse() {
    let node = WebViewNode(url: "https://example.com")
      .javascriptBridge(allowlist: ["example.com"], mainFrameOnly: false)

    let dict = node.attributes[.javascriptBridge]?.dict
    XCTAssertEqual(dict?[.mainFrameOnly]?.bool, false)
  }

  func testJavascriptBridgeMultipleAllowlist() {
    let node = WebViewNode(url: "https://example.com")
      .javascriptBridge(allowlist: ["example.com", "test.com", "app.local"])

    let allowlist = node.attributes[.javascriptBridge]?.dict?[.allowlist]?.array?.compactMap { $0.string }
    XCTAssertEqual(allowlist?.count, 3)
    XCTAssertTrue(allowlist?.contains("example.com") ?? false)
    XCTAssertTrue(allowlist?.contains("test.com") ?? false)
    XCTAssertTrue(allowlist?.contains("app.local") ?? false)
  }

  func testInspectable() {
    let node = WebViewNode(url: "https://example.com").inspectable()
    XCTAssertEqual(node.attributes[.isInspectable]?.bool, true)
  }

  func testIsInspectable() {
    let node = WebViewNode(url: "https://example.com").isInspectable(true)
    XCTAssertEqual(node.attributes[.isInspectable]?.bool, true)
  }

  func testIsInspectableFalse() {
    let node = WebViewNode(url: "https://example.com").isInspectable(false)
    XCTAssertEqual(node.attributes[.isInspectable]?.bool, false)
  }
}
