import SceneKit
import SwiftUIMLCore

struct SKRotationModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .skRotation

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

    // Support both degrees and radians
    let angleRadians: Float
    if let degrees = dict[.degrees]?.float {
      angleRadians = degrees * Float.pi / 180.0
    }
    else if let radians = dict[.radians]?.float {
      angleRadians = radians
    }
    else {
      return false
    }
    scnNode.rotation = SCNVector4(x: x, y: y, z: z, w: angleRadians)
    return true
  }
}
