public extension Node {
  /// Configures JavaScript bridge for WebView
  /// - Parameters:
  ///   - enabled: If the js bridge is enabled
  ///   - allowlist: The urls to allowlist for use communicating
  ///   - scriptInjectionTime: When to add the bridge to the page
  ///   - mainFrameOnly: Whether to limit to main frame only
  func javascriptBridge(
    enabled: Bool = true,
    allowlist: [String],
    scriptInjectionTime: UserScriptInjectionTime? = nil,
    mainFrameOnly: Bool = true
  ) -> Node {
    var dict: [AttributeKey: AttributeValue] = [
      .enabled: .bool(enabled),
      .allowlist: .array(allowlist.map { .string($0) }),
      .mainFrameOnly: .bool(mainFrameOnly),
    ]
    if let scriptInjectionTime {
      dict[.injectionTime] = .string(scriptInjectionTime.rawValue)
    }
    return addingAttribute(.javascriptBridge, value: .dict(dict))
  }

  /// Sets a webview to inspectable
  func inspectable() -> Node {
    addingAttribute(.isInspectable, value: .bool(true))
  }

  /// If the webview should be inspectable
  func isInspectable(_ value: Bool) -> Node {
    addingAttribute(.isInspectable, value: .bool(value))
  }
}
