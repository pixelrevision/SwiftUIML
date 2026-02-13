import SwiftUI
import SwiftUIMLCore
/// Protocol for types that can render modifiers
public protocol ModifierRenderer {
  static var key: AttributeKey { get }
  /// Apply modifier to view. Returns nil if modifier cannot be applied (wrong type, invalid value, etc.)
  /// - Parameter view: The view to modify. Can be used generically or downcast to specific types.
  /// - Parameter node: The node being rendered (passed by reference for efficiency, read-only)
  /// - Parameter value: The attribute value to apply
  /// - Returns: The modified view, or nil if the modifier cannot be applied
  static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)?
}

/// Protocol for types that can render views
public protocol ViewRenderer {
  static var type: ViewType { get }
  static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View
}

/// Context containing all registered renderers for views and modifiers
public class RenderContext {
  private let modifiers: [AttributeKey: any ModifierRenderer.Type]
  private let views: [ViewType: any ViewRenderer.Type]

  public init(
    modifiers: [AttributeKey: any ModifierRenderer.Type] = [:],
    views: [ViewType: any ViewRenderer.Type] = [:]
  ) {
    self.modifiers = modifiers
    self.views = views
  }

  public func modifier(for key: AttributeKey) -> (any ModifierRenderer.Type)? {
    modifiers[key]
  }

  public func view(for type: ViewType) -> (any ViewRenderer.Type)? {
    views[type]
  }

  public func with(_ renderer: any ModifierRenderer.Type) -> RenderContext {
    var newModifiers = modifiers
    newModifiers[renderer.key] = renderer
    return RenderContext(modifiers: newModifiers, views: views)
  }

  public func with(_ renderer: any ViewRenderer.Type) -> RenderContext {
    var newViews = views
    newViews[renderer.type] = renderer
    return RenderContext(modifiers: modifiers, views: newViews)
  }
}

struct RenderContextKey: EnvironmentKey {
  static let defaultValue = RenderContext.default
}

extension EnvironmentValues {
  public var renderContext: RenderContext {
    get { self[RenderContextKey.self] }
    set { self[RenderContextKey.self] = newValue }
  }
}
