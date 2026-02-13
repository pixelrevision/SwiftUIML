//
//  SKTextureRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

import SwiftUI
import SceneKit
import SwiftUIMLCore

/// Helper for applying SKTexture node configuration to SceneKit materials.
///
/// Note: SKTexture is not a renderable node - it's a configuration object used
/// as an attribute value for texture modifiers.
struct SKTextureRenderer {
  /// Applies texture configuration from a node to an SCNMaterialProperty.
  ///
  /// - Parameters:
  ///   - property: The material property to configure (e.g., material.diffuse)
  ///   - node: The texture node containing configuration
  static func apply(to property: SCNMaterialProperty, node: borrowing Node) {
    // Load texture from URL or bundle
    if let urlString = node.attributes[.textureURL]?.string,
       let url = URL(string: urlString) {
      property.contents = url
    }
    else if let bundleName = node.attributes[.textureBundle]?.string {
      property.contents = UIImage(named: bundleName)
    }

    // Configure wrapping modes
    if let wrapSString = node.attributes[.textureWrapS]?.string,
       let wrapS = SCNWrapMode(rawValue: wrapSString) {
      property.wrapS = wrapS
    }

    if let wrapTString = node.attributes[.textureWrapT]?.string,
       let wrapT = SCNWrapMode(rawValue: wrapTString) {
      property.wrapT = wrapT
    }

    // Configure intensity
    if let intensity = node.attributes[.textureIntensity]?.cgFloat {
      property.intensity = intensity
    }

    // Configure filtering
    if let minFilterString = node.attributes[.textureMinificationFilter]?.string,
       let minFilter = SCNFilterMode(rawValue: minFilterString) {
      property.minificationFilter = minFilter
    }

    if let magFilterString = node.attributes[.textureMagnificationFilter]?.string,
       let magFilter = SCNFilterMode(rawValue: magFilterString) {
      property.magnificationFilter = magFilter
    }
  }
}

// MARK: - SceneKit Enum Extensions

extension SCNWrapMode {
  init?(rawValue: String) {
    switch rawValue {
    case "clamp": self = .clamp
    case "repeat": self = .repeat
    case "clampToBorder": self = .clampToBorder
    case "mirror": self = .mirror
    default: return nil
    }
  }
}

extension SCNFilterMode {
  init?(rawValue: String) {
    switch rawValue {
    case "nearest": self = .nearest
    case "linear": self = .linear
    default: return nil
    }
  }
}
