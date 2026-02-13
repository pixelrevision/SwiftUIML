/// Creates a SceneKit texture configuration node.
///
/// SKTexture is not a renderable view - it's a configuration object used
/// as an attribute value for texture modifiers like `.skDiffuseTexture()`.
///
/// Example usage:
/// ```swift
/// SKSphereNode(radius: 1.0)
///   .skDiffuseTexture(
///     SKTextureNode(url: "https://example.com/brick.png")
///       .wrapS(.repeat)
///       .wrapT(.repeat)
///       .intensity(0.8)
///   )
/// ```
///
/// - Parameters:
///   - url: URL string for remote or local texture file
///   - bundle: Bundle resource name (mutually exclusive with url)
public func SKTextureNode(url: String) -> Node {
  Node(
    type: .skTexture,
    attributes: [
      .textureURL: .string(url),
    ]
  )
}

/// Creates a SceneKit texture node from a bundle resource.
///
/// - Parameter bundle: Name of the image in the app bundle
public func SKTextureNode(bundle: String) -> Node {
  Node(
    type: .skTexture,
    attributes: [
      .textureBundle: .string(bundle),
    ]
  )
}

extension Node {
  /// Sets the horizontal (S) texture wrapping mode.
  ///
  /// Controls what happens when texture coordinates exceed the 0.0-1.0 range horizontally.
  ///
  /// - Parameter mode: Wrapping mode (.clamp, .repeat, .clampToBorder, .mirror)
  public func wrapS(_ mode: Node.TextureWrapMode) -> Node {
    addingAttribute(.textureWrapS, value: .string(mode.rawValue))
  }

  /// Sets the vertical (T) texture wrapping mode.
  ///
  /// Controls what happens when texture coordinates exceed the 0.0-1.0 range vertically.
  ///
  /// - Parameter mode: Wrapping mode (.clamp, .repeat, .clampToBorder, .mirror)
  public func wrapT(_ mode: Node.TextureWrapMode) -> Node {
    addingAttribute(.textureWrapT, value: .string(mode.rawValue))
  }

  /// Sets the texture intensity multiplier (0.0 - 1.0).
  ///
  /// Controls how strongly the texture affects the material property.
  ///
  /// - Parameter value: Intensity from 0.0 (no effect) to 1.0 (full effect)
  public func intensity(_ value: Double) -> Node {
    addingAttribute(.textureIntensity, value: .number(value))
  }

  /// Sets the minification filter (when texture is smaller than screen pixels).
  ///
  /// - Parameter filter: Filter mode (.nearest for pixelated, .linear for smooth)
  public func minificationFilter(_ filter: Node.TextureFilterMode) -> Node {
    addingAttribute(.textureMinificationFilter, value: .string(filter.rawValue))
  }

  /// Sets the magnification filter (when texture is larger than screen pixels).
  ///
  /// - Parameter filter: Filter mode (.nearest for pixelated, .linear for smooth)
  public func magnificationFilter(_ filter: Node.TextureFilterMode) -> Node {
    addingAttribute(.textureMagnificationFilter, value: .string(filter.rawValue))
  }
}
