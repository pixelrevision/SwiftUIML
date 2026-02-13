//
//  SKScaleModifierRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 10/31/25.
//

import SceneKit
import SwiftUIMLCore

struct SKScaleModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skScale

  static func apply(
    to scnNode: SCNNode,
    node: borrowing Node,
    value: AttributeValue,
    context: SKContext,
    messageHandler: MessageHandler?
  ) -> Bool {
    if let dict = value.dict {
      // Non-uniform scale
      let x = dict[.x]?.float ?? 1.0
      let y = dict[.y]?.float ?? 1.0
      let z = dict[.z]?.float ?? 1.0
      scnNode.scale = SCNVector3(x: x, y: y, z: z)
      return true
    }
    else if let scale = value.float {
      // Uniform scale
      scnNode.scale = SCNVector3(x: scale, y: scale, z: scale)
      return true
    }
    return false
  }
}
