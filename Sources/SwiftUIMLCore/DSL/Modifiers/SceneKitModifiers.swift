/// Extension for SceneKit-specific modifiers
public extension Node {
  // MARK: - Transform Modifiers

  /// Sets the position of a SceneKit node in 3D space
  func skPosition(x: Double = 0, y: Double = 0, z: Double = 0) -> Node {
    addingAttribute(
      .skPosition,
      value: .dict([
        .x: .number(x),
        .y: .number(y),
        .z: .number(z),
      ])
    )
  }

  /// Sets the rotation of a SceneKit node using degrees
  /// - Parameters:
  ///   - degrees: Rotation angle in degrees
  ///   - x: X component of rotation axis
  ///   - y: Y component of rotation axis
  ///   - z: Z component of rotation axis
  func skRotation(degrees: Double, x: Double = 0, y: Double = 1, z: Double = 0) -> Node {
    addingAttribute(
      .skRotation,
      value: .dict([
        .degrees: .number(degrees),
        .x: .number(x),
        .y: .number(y),
        .z: .number(z),
      ])
    )
  }

  /// Sets the rotation of a SceneKit node using radians
  /// - Parameters:
  ///   - radians: Rotation angle in radians
  ///   - x: X component of rotation axis
  ///   - y: Y component of rotation axis
  ///   - z: Z component of rotation axis
  func skRotation(radians: Double, x: Double = 0, y: Double = 1, z: Double = 0) -> Node {
    addingAttribute(
      .skRotation,
      value: .dict([
        .radians: .number(radians),
        .x: .number(x),
        .y: .number(y),
        .z: .number(z),
      ])
    )
  }

  /// Sets uniform scale for a SceneKit node
  func skScale(_ scale: Double) -> Node {
    addingAttribute(.skScale, value: .number(scale))
  }

  /// Sets non-uniform scale for a SceneKit node
  func skScale(x: Double = 1, y: Double = 1, z: Double = 1) -> Node {
    addingAttribute(
      .skScale,
      value: .dict([
        .x: .number(x),
        .y: .number(y),
        .z: .number(z),
      ])
    )
  }

  // MARK: - SceneKit View Properties

  /// Enables camera control (pan, zoom, rotate)
  func allowsCameraControl(_ allows: Bool = true) -> Node {
    addingAttribute(.allowsCameraControl, value: .bool(allows))
  }

  /// Enables automatic default lighting in the scene
  func autoenablesDefaultLighting(_ enables: Bool = true) -> Node {
    addingAttribute(.autoenablesDefaultLighting, value: .bool(enables))
  }

  /// Shows SceneKit rendering statistics overlay
  func showsStatistics(_ shows: Bool = true) -> Node {
    addingAttribute(.showsStatistics, value: .bool(shows))
  }

  /// Adds a default camera to the scene positioned at (0, 0, 10)
  func addDefaultCamera(_ add: Bool = true) -> Node {
    addingAttribute(.addDefaultCamera, value: .bool(add))
  }

  /// Adds a default omni light to the scene
  func addDefaultLight(_ add: Bool = true) -> Node {
    addingAttribute(.addDefaultLight, value: .bool(add))
  }

  // MARK: - Material Properties

  /// Sets the diffuse material property (base color).
  /// Supports color value, texture, or both where the texture modulates the color.
  ///
  /// - Parameters:
  ///   - color: Color string (hex, named color, etc.)
  ///   - texture: SKTexture node with texture configuration
  func skDiffuse(_ color: String? = nil, texture: Node? = nil) -> Node {
    var result = self
    if let color = color {
      result = result.addingAttribute(.skDiffuse, value: .string(color))
    }
    if let texture = texture {
      result = result.addingAttribute(.skDiffuseTexture, value: .node(texture))
    }
    return result
  }

  /// Sets the diffuse texture from a URL string (convenience).
  ///
  /// - Parameter url: URL string for the texture
  func skDiffuse(texture url: String) -> Node {
    addingAttribute(.skDiffuseTexture, value: .string(url))
  }

  /// Sets the specular material property (highlight color).
  /// Supports color value, texture, or both where the texture modulates the color.
  ///
  /// - Parameters:
  ///   - color: Color string (hex, named color, etc.)
  ///   - texture: SKTexture node with texture configuration
  func skSpecular(_ color: String? = nil, texture: Node? = nil) -> Node {
    var result = self
    if let color = color {
      result = result.addingAttribute(.skSpecular, value: .string(color))
    }
    if let texture = texture {
      result = result.addingAttribute(.skSpecularTexture, value: .node(texture))
    }
    return result
  }

  /// Sets the specular texture from a URL string (convenience).
  ///
  /// - Parameter url: URL string for the texture
  func skSpecular(texture url: String) -> Node {
    addingAttribute(.skSpecularTexture, value: .string(url))
  }

  /// Sets the emission material property (glow color).
  /// Supports color value, texture, or both where the texture modulates the color.
  ///
  /// - Parameters:
  ///   - color: Color string (hex, named color, etc.)
  ///   - texture: SKTexture node with texture configuration
  func skEmission(_ color: String? = nil, texture: Node? = nil) -> Node {
    var result = self
    if let color = color {
      result = result.addingAttribute(.skEmission, value: .string(color))
    }
    if let texture = texture {
      result = result.addingAttribute(.skEmissionTexture, value: .node(texture))
    }
    return result
  }

  /// Sets the emission texture from a URL string (convenience).
  ///
  /// - Parameter url: URL string for the texture
  func skEmission(texture url: String) -> Node {
    addingAttribute(.skEmissionTexture, value: .string(url))
  }

  /// Sets the ambient material property (ambient light response color).
  ///
  /// - Parameter color: Color string (hex, named color, etc.)
  func skAmbient(_ color: String) -> Node {
    addingAttribute(.skAmbient, value: .string(color))
  }

  /// Sets the shininess material property (glossiness, 0.0 - 1.0).
  ///
  /// - Parameter value: Shininess value (0.0 - 1.0)
  func skShininess(_ value: Double) -> Node {
    addingAttribute(.skShininess, value: .number(value))
  }

  /// Sets the roughness material property for PBR rendering (0.0 - 1.0).
  /// Supports value only, texture only, or both where the texture modulates the value.
  ///
  /// - Parameters:
  ///   - value: Roughness value (0.0 - 1.0)
  ///   - texture: SKTexture node with texture configuration
  func skRoughness(_ value: Double? = nil, texture: Node? = nil) -> Node {
    var result = self
    if let value = value {
      result = result.addingAttribute(.skRoughness, value: .number(value))
    }
    if let texture = texture {
      result = result.addingAttribute(.skRoughnessTexture, value: .node(texture))
    }
    return result
  }

  /// Sets the roughness texture from a URL string (convenience).
  ///
  /// - Parameter url: URL string for the texture
  func skRoughness(texture url: String) -> Node {
    addingAttribute(.skRoughnessTexture, value: .string(url))
  }

  /// Sets the metalness material property for PBR rendering (0.0 - 1.0).
  /// Supports value only, texture only, or both where the texture modulates the value.
  ///
  /// - Parameters:
  ///   - value: Metalness value (0.0 - 1.0)
  ///   - texture: SKTexture node with texture configuration
  func skMetalness(_ value: Double? = nil, texture: Node? = nil) -> Node {
    var result = self
    if let value = value {
      result = result.addingAttribute(.skMetalness, value: .number(value))
    }
    if let texture = texture {
      result = result.addingAttribute(.skMetalnessTexture, value: .node(texture))
    }
    return result
  }

  /// Sets the metalness texture from a URL string (convenience).
  ///
  /// - Parameter url: URL string for the texture
  func skMetalness(texture url: String) -> Node {
    addingAttribute(.skMetalnessTexture, value: .string(url))
  }

  // MARK: - Texture-Only Properties

  /// Sets the normal texture (bump/normal map) of the material.
  ///
  /// - Parameter texture: SKTexture node with texture configuration
  func skNormal(texture: Node) -> Node {
    addingAttribute(.skNormalTexture, value: .node(texture))
  }

  /// Sets the normal texture from a URL string (convenience).
  ///
  /// - Parameter url: URL string for the texture
  func skNormal(texture url: String) -> Node {
    addingAttribute(.skNormalTexture, value: .string(url))
  }

  /// Sets the ambient occlusion texture (AO map) of the material.
  ///
  /// - Parameter texture: SKTexture node with texture configuration
  func skAmbientOcclusion(texture: Node) -> Node {
    addingAttribute(.skAmbientOcclusionTexture, value: .node(texture))
  }

  /// Sets the ambient occlusion texture from a URL string (convenience).
  ///
  /// - Parameter url: URL string for the texture
  func skAmbientOcclusion(texture url: String) -> Node {
    addingAttribute(.skAmbientOcclusionTexture, value: .string(url))
  }
}
