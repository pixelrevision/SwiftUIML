//
//  SKAmbientModifierRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKAmbientModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skAmbient

  static func apply(
    to scnNode: SCNNode,
    node: borrowing Node,
    value: AttributeValue,
    context: SKContext,
    messageHandler: MessageHandler?
  ) -> Bool {
    guard
      let geometry = scnNode.geometry,
      let colorHex = value.string
    else {
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

    material.ambient.contents = HexColor.colorFromHex(colorHex)
    return true
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      SKAmbientLightNode(color: "#FF6600", intensity: 500)

      SKSphereNode(radius: 1.0)
        .skDiffuse("#FFFFFF")
        .skAmbient("#FF6600")
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
