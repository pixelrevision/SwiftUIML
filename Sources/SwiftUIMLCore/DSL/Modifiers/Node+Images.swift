public extension Node {
  /// Makes an image resizable
  func resizable() -> Node {
    addingAttribute(.resizable, value: .bool(true))
  }

  /// Sets the rendering mode for an image
  /// - Parameter mode: Rendering mode
  func renderingMode(_ mode: RenderingMode) -> Node {
    addingAttribute(.renderingMode, value: .string(mode.rawValue))
  }

  /// Sets the aspect ratio
  /// - Parameters:
  ///   - ratio: Aspect ratio value
  ///   - contentMode: Content mode
  func aspectRatio(_ ratio: Double, contentMode: ContentMode = .fit) -> Node {
    addingAttribute(.aspectRatio, value: [
      .ratio: .number(ratio),
      .contentMode: .string(contentMode.rawValue),
    ])
  }

  /// Sets the aspect ratio from a string
  /// - Parameters:
  ///   - ratio: Aspect ratio string (e.g., "16:9")
  ///   - contentMode: Content mode
  func aspectRatio(_ ratio: String, contentMode: ContentMode = .fit) -> Node {
    addingAttribute(.aspectRatio, value: [
      .ratio: .string(ratio),
      .contentMode: .string(contentMode.rawValue),
    ])
  }
}
