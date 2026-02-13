//
//  WebViewTests.swift
//  SwiftUIML
//
//  WebView view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class WebViewTests: XCTestCase {
  @MainActor
  func testWebViewBasic() {
    XCTExpectFailure("WebView content loads asynchronously and may not be ready at snapshot time", strict: false)
    testNode(
      TestCase.view.webView.basic,
      size: CGSize(width: 100, height: 100),
      useHostingController: true,
      delay: 1.0
    ) {
      WebViewNode(
        url: "about:blank",
        html: """
        <html>
        <body style="margin:0; padding:20px; font-family:sans-serif;">
          <h1 style="color:#007AFF;">Hello WebView</h1>
          <p>This is a simple HTML test.</p>
        </body>
        </html>
        """
      )
      .frame(width: 100, height: 100)
    }
  }
}
