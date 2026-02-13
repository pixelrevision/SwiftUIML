//
//  SKLightRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

import SwiftUI
import SceneKit
import SwiftUIMLCore

struct SKLightRenderer: SKNodeRenderer {
  static let type: ViewType = .skLight
  
  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode {
    let light = SCNLight()
    
    // Light type
    let lightTypeString = node.attributes[.lightType]?.string ?? "omni"
    light.type = SCNLight.LightType(lightTypeString)
    
    // Color
    if let colorHex = node.attributes[.color]?.string {
      light.color = HexColor.colorFromHex(colorHex)
    }
    
    // Intensity
    if let intensity = node.attributes[.intensity]?.cgFloat {
      light.intensity = intensity
    }
    
    // Temperature (color temperature in Kelvin)
    if let temp = node.attributes[.temperature]?.cgFloat {
      light.temperature = temp
    }
    
    // Shadow properties
    if let castsShadow = node.attributes[.castsShadow]?.bool {
      light.castsShadow = castsShadow
    }
    
    if let shadowRadius = node.attributes[.shadowRadius]?.cgFloat {
      light.shadowRadius = shadowRadius
    }
    
    if let shadowColorHex = node.attributes[.shadowColor]?.string {
      light.shadowColor = HexColor.colorFromHex(shadowColorHex)
    }
    
    // Spot light specific properties
    if light.type == .spot {
      if let innerAngle = node.attributes[.spotInnerAngle]?.cgFloat {
        light.spotInnerAngle = innerAngle
      }
      
      if let outerAngle = node.attributes[.spotOuterAngle]?.cgFloat {
        light.spotOuterAngle = outerAngle
      }
    }
    
    let lightNode = SCNNode()
    lightNode.light = light
    
    context.register(scnNode: lightNode, for: node.id)
    
    lightNode.applySKModifiers(node, context: context, handler: messageHandler)
    
    return lightNode
  }
}

#Preview {
  DebugView {
    SceneKitNode {
      // Camera slightly above, angled down at sphere
      SKCameraNode()
        .skPosition(x: 0, y: 3, z: 10)
        .skRotation(degrees: -17, x: 1, y: 0, z: 0)

      SKGroupNode {
        SKOmniLightNode(color: "#FF8800", intensity: 500)
          .skPosition(x: -3, y: 3, z: 2)

        SKDirectionalLightNode(color: "#FFFFCC", intensity: 800, castsShadow: true)
          .skRotation(degrees: -45, x: 1, y: 0, z: 0)

        SKSpotLightNode(color: "#00FF00", intensity: 1000, innerAngle: 10, outerAngle: 30)
          .skPosition(x: 3, y: 5, z: 2)
          .skRotation(degrees: -60, x: 1, y: 0, z: 0)

        SKAmbientLightNode(color: "#4444FF", intensity: 100)

        SKSphereNode(radius: 0.5)
          .skDiffuse("#FF0000")
          .skSpecular("#FFFFFF")
          .skShininess(1.0)

        SKPlaneNode(width: 20, height: 20)
          .skPosition(x: 0, y: -1, z: 0)
          .skRotation(degrees: -90, x: 1, y: 0, z: 0)
          .skDiffuse("#CCCCCC")
          .skSpecular("#888888")
      }
    }
    .allowsCameraControl()
    .backgroundColor("#CCCCCC")
  }
}
