//
//  SKHiddenModifierRenderer.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

import SceneKit
import SwiftUIMLCore

struct SKHiddenModifierRenderer: SKModifierRenderer {
  static let key: AttributeKey = .hidden

  static func apply(
    to scnNode: SCNNode,
    node: borrowing Node,
    value: AttributeValue,
    context: SKContext,
    messageHandler: MessageHandler?
  ) -> Bool {
    guard let hidden = value.bool else {
      return false
    }
    scnNode.isHidden = hidden
    return true
  }
}
