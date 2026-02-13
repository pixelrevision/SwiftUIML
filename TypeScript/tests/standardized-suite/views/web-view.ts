/**
 * WebView view test definitions
 * Must match Swift WebViewTests.swift
 */
import { Node, WebView } from "../../../src/index";

export function generateWebViewTests(): Record<string, Node> {
  return {
    "view.web-view.basic": WebView(
      "about:blank",
      `<html>
<body style="margin:0; padding:20px; font-family:sans-serif;">
  <h1 style="color:#007AFF;">Hello WebView</h1>
  <p>This is a simple HTML test.</p>
</body>
</html>`,
    ).frame(100, 100),
  };
}
