import SwiftUI
import SwiftUIMLCore
import WebKit

public struct WebViewRenderer: ViewRenderer {
  public static let type: ViewType = .webView

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    return WrappedWebView(node: node, messageHandler: messageHandler)
      .applyModifiers(node, context: context, handler: messageHandler)
  }
}

#Preview {
  WebViewPreview()
}

struct WebViewPreview: View {
  @Environment(\.messageQueue) var messageQueue

  var body: some View {
    DebugView {
      TextNode("Native Heading")
        .font(size: 30, weight: .black)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(leading: 20, trailing: 20)
      WebViewNode(url: "https://example.com", html: """
        <html>
          <head>
            <title>Sample</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
            <style>
              body {
                font-family: -apple-system;
                padding: 0px;
                margin: 0px;
                background-color: #ffffff;
                color: #000000;
              }
              h3 {
                color: #007AFF;
              }
              @media (prefers-color-scheme: dark) {
                body {
                  background-color: #000000;
                  color: #ffffff;
                }
                h3 {
                  color: #0A84FF;
                }
              }
            </style>
          </head>
          <body>
            <h3>WebView Content</h3>
            <p id="content">This is rendered using html</p>
            <button onclick="postMessage('sent from webview')">Send Message</button>
          </body>
          <script>
          window.onmessage = function(message) {
            document.getElementById('content').textContent = message;
          };
          </script>
        </html>
        """)
      .javascriptBridge(
        enabled: true,
        allowlist: ["example.com"],
        scriptInjectionTime: .atDocumentStart
      )
      .addingAttribute(.isScrollEnabled, value: false)
      .frame(height: 100)
      .padding(leading: 20, trailing: 20)
    }
    .messageHandler { message in
      print("Message: \(message)")
    }

    Divider()

    Button("Post Message to Web View") {
      messageQueue.send("Updated text sent from the app")
    }
  }
}
