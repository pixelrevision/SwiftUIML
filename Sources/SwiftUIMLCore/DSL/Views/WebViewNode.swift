/// Creates a web view node from a URL  
public func WebViewNode(url: String, html: String? = nil) -> Node {
  var attrs: Node.Attributes = [.url: .string(url)]
  if let html {
    attrs[.html] = .string(html)
  }
  return Node(type: .webView, attributes: attrs)
}
