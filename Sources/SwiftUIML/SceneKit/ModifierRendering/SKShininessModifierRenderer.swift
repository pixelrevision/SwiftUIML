//
//  SKShininessModifierRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKShininessModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skShininess

  static func apply(
    to scnNode: SCNNode,
    node: borrowing Node,
    value: AttributeValue,
    context: SKContext,
    messageHandler: MessageHandler?
  ) -> Bool {
    guard
      let geometry = scnNode.geometry,
      let shininess = value.cgFloat
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
    material.shininess = shininess
    return true
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      SKCameraNode()
        .skPosition(x: 0, y: 0, z: 5)

      SKOmniLightNode(intensity: 1000)
        .skPosition(x: 2, y: 2, z: 3)

      SKSphereNode(radius: 1.0)
        .skDiffuse("#3388FF")
        .skSpecular("#FFFFFF")
        .skShininess(1.0)
    }
    .addDefaultCamera()
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
