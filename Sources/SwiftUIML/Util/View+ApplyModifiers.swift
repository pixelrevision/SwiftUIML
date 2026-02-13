import SwiftUI
import SwiftUIMLCore
public extension View {
  func applyModifiers(
    _ node: borrowing Node,
    context: RenderContext,
    handler: MessageHandler?
  ) -> some View {
    var view: any View = self  // Start with concrete type
    var needsTypeErasure = false
    for (key, value) in node.attributes {
      guard let modifierType = context.modifier(for: key) else { continue }
      guard let modified = modifierType.apply(to: view, node: node, value: value, messageHandler: handler) else {
        continue
      }
      // Check if this modifier changed the type
      // If it did, we need to wrap for the next iteration
      if needsTypeErasure {
        view = AnyView(modified)
      }
      else {
        view = modified
        // After first modifier that works, we may have changed types
        needsTypeErasure = true
      }
    }
    return AnyView(view)
  }
}
