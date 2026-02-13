//
//  SKPositionModifierRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 10/31/25.
//

import SceneKit
import SwiftUIMLCore

struct SKPositionModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skPosition

  static func apply(
    to scnNode: SCNNode,
    node: borrowing Node,
    value: AttributeValue,
    context: SKContext,
    messageHandler: MessageHandler?
  ) -> Bool {
    guard let dict = value.dict else {
      return false
    }
    let x = dict[.x]?.float ?? 0.0
    let y = dict[.y]?.float ?? 0.0
    let z = dict[.z]?.float ?? 0.0
    scnNode.position = SCNVector3(x: x, y: y, z: z)
    return true
  }
}
