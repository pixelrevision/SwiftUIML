//
//  SKEmissionModifierRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKEmissionModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skEmission

  static func apply(
    to scnNode: SCNNode,
    node: borrowing Node,
    value: AttributeValue,
    context: SKContext,
    messageHandler: MessageHandler?
  ) -> Bool {
    guard let geometry = scnNode.geometry else {
      return false
    }

    // Get or create the first material
    let material: SCNMaterial
    if let firstMaterial = geometry.firstMaterial {
      material = firstMaterial
    }
    else {
      material = SCNMaterial()
      geometry.materials = [material]
    }

    // Apply color value if present
    if let colorHex = value.string {
      material.emission.contents = HexColor.colorFromHex(colorHex)
    }

    // Apply texture if present (will modulate the color)
    if let textureNode = node.attributes[.skEmissionTexture]?.node {
      SKTextureRenderer.apply(to: material.emission, node: textureNode)
    }
    else if let textureURL = node.attributes[.skEmissionTexture]?.string,
              let url = URL(string: textureURL) {
      material.emission.contents = url
    }

    return true
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      SKSphereNode(radius: 1.0)
        .skDiffuse("#333333")
        .skEmission("#00FF88")
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
