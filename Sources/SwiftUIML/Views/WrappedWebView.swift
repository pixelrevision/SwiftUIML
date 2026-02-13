import SwiftUI
import SwiftUIMLCore
import WebKit

struct WrappedWebView: View {
  let node: Node
  let messageHandler: MessageHandler?

  @State private var webViewCoordinator: WebViewRepresentable.Coordinator?

  var body: some View {
    WebViewRepresentable(node: node, messageHandler: messageHandler, coordinatorBinding: $webViewCoordinator)
      .onMessage(nodeId: node.id) { message in
        webViewCoordinator?.postMessage(message)
      }
  }
}

struct WebViewRepresentable: UIViewRepresentable {
  let node: Node
  let messageHandler: MessageHandler?
  @Binding var coordinatorBinding: Coordinator?

  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView(frame: .zero, configuration: configuration(context: context))
    context.coordinator.webView = webView
    setup(webView: webView)
    DispatchQueue.main.async {
      coordinatorBinding = context.coordinator
    }
    return webView
  }

  func updateUIView(_ webView: WKWebView, context: Context) {
    guard let url = node.attributes[.url]?.url else {
      return
    }
    if let html = node.attributes[.html]?.string {
      webView.loadHTMLString(html, baseURL: url)
    }
    else {
      webView.load(URLRequest(url: url))
    }
  }

  private func configuration(context: Context) -> WKWebViewConfiguration {
    let config = WKWebViewConfiguration()
    if let bridgeSettings = node.attributes[.javascriptBridge]?.dict, bridgeSettings[.enabled]?.bool == true {
      config.userContentController.add(context.coordinator, name: "app")
      let script = WKUserScript(
        source: """
        function postMessage(message) {
          window.webkit.messageHandlers.app.postMessage(message);
        }
        """,
        injectionTime: injectionTime(for: bridgeSettings),
        forMainFrameOnly: bridgeSettings[.mainFrameOnly]?.bool != false
      )
      config.userContentController.addUserScript(script)
    }
    return config
  }

  private func setup(webView: WKWebView) {
    if node.attributes[.isScrollEnabled]?.bool == false {
      webView.scrollView.isScrollEnabled = false
    }
    webView.isInspectable = node.attributes[.isInspectable]?.bool == true
  }

  private func injectionTime(for bridgeSettings: [AttributeKey: AttributeValue]) -> WKUserScriptInjectionTime {
    switch bridgeSettings[.injectionTime]?.string {
    case "atDocumentStart":
      return .atDocumentStart
    case "atDocumentEnd":
      return .atDocumentEnd
    default:
      return .atDocumentStart
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self, node: node, messageHandler: messageHandler)
  }

  class Coordinator: NSObject, WKScriptMessageHandler {
    let parent: WebViewRepresentable
    let node: Node
    let messageHandler: MessageHandler?
    weak var webView: WKWebView?

    init(_ parent: WebViewRepresentable, node: Node, messageHandler: MessageHandler?) {
      self.parent = parent
      self.node = node
      self.messageHandler = messageHandler
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
      guard
        let messageHandler,
        let url = message.frameInfo.request.url,
        allowListed(url: url),
        let message = AttributeValue(scriptMessageBody: message.body)
      else {
        return
      }
      messageHandler(message)
    }

    func allowListed(url: URL) -> Bool {
      guard let allowlist = node.attributes[.javascriptBridge]?.dict?[.allowlist]?.array else {
        return false
      }
      for item in allowlist.compactMap({ $0.string }) where url.host == item {
        return true
      }
      return false
    }

    /// Send a message from Swift to the webview's JavaScript context
    func postMessage(_ message: AttributeValue) {
      // Check if JS bridge is enabled
      guard
        let bridgeSettings = node.attributes[.javascriptBridge]?.dict,
        bridgeSettings[.enabled]?.bool == true
      else {
        return
      }
      // Check if current URL is allowlisted
      guard
        let webView = webView,
        let currentURL = webView.url,
        allowListed(url: currentURL)
      else {
        return
      }
      // Convert AttributeValue to JSON string
      guard
        let jsonData = try? JSONEncoder().encode(message),
        let jsonString = String(data: jsonData, encoding: .utf8)
      else {
        return
      }
      // Escape the JSON string for JavaScript
      let escapedJSON = jsonString
        .replacingOccurrences(of: "\\", with: "\\\\")
        .replacingOccurrences(of: "'", with: "\\'")
        .replacingOccurrences(of: "\n", with: "\\n")
        .replacingOccurrences(of: "\r", with: "\\r")
      // Call window.onmessage if it exists
      let script = """
      (function() {
        try {
          var message = JSON.parse('\(escapedJSON)');
          if (typeof window.onmessage === 'function') {
            window.onmessage(message);
          } else {
            console.warn('window.onmessage is not defined');
          }
        } catch (e) {
          console.error('Failed to deliver message to window.onmessage:', e);
        }
      })();
      """
      webView.evaluateJavaScript(script) { _, _ in }
    }
  }
}
