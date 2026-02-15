import SwiftUI
import SceneKit
import SwiftUIMLCore

public extension SCNNode {
  func applySKModifiers(
    _ node: borrowing Node,
    context: SKContext,
    handler: MessageHandler?
  ) {
    for (key, value) in node.attributes {
      guard let modifierType = context.renderContext.modifier(for: key) else { continue }
      _ = modifierType.apply(
        to: self,
        node: node,
        value: value,
        context: context,
        messageHandler: handler
      )
      // Ignore return value - failures are silent (consistent with SwiftUI modifier behavior)
    }
  }
}
