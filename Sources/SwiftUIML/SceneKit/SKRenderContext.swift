import SwiftUI
import SwiftUIMLCore
import SceneKit

/// Protocol for types that can render SceneKit nodes
public protocol SKNodeRenderer {
  static var type: ViewType { get }
  static func render(node: Node, context: SKContext, messageHandler: MessageHandler?) -> SCNNode
}

/// Protocol for types that can apply modifiers to SceneKit nodes
public protocol SKModifierRenderer {
  static var key: AttributeKey { get }
  /// Apply modifier to SCNNode. Returns true if successfully applied.
  static func apply(
    to scnNode: SCNNode,
    node: borrowing Node,
    value: AttributeValue,
    context: SKContext,
    messageHandler: MessageHandler?
  ) -> Bool
}

/// Registry containing all SceneKit renderer types
public class SKRenderContext {
  private let modifiers: [AttributeKey: any SKModifierRenderer.Type]
  private let nodes: [ViewType: any SKNodeRenderer.Type]

  public init(
    modifiers: [AttributeKey: any SKModifierRenderer.Type] = [:],
    nodes: [ViewType: any SKNodeRenderer.Type] = [:]
  ) {
    self.modifiers = modifiers
    self.nodes = nodes
  }

  public func modifier(for key: AttributeKey) -> (any SKModifierRenderer.Type)? {
    modifiers[key]
  }

  public func node(for type: ViewType) -> (any SKNodeRenderer.Type)? {
    nodes[type]
  }

  public func with(_ renderer: any SKModifierRenderer.Type) -> SKRenderContext {
    var newModifiers = modifiers
    newModifiers[renderer.key] = renderer
    return SKRenderContext(modifiers: newModifiers, nodes: nodes)
  }

  public func with(_ renderer: any SKNodeRenderer.Type) -> SKRenderContext {
    var newNodes = nodes
    newNodes[renderer.type] = renderer
    return SKRenderContext(modifiers: modifiers, nodes: newNodes)
  }
}

/// Context for SceneKit rendering containing both renderer registries and scene state
public class SKContext {
  let renderContext: SKRenderContext
  let scene: SCNScene
  var nodeRegistry: [String: SCNNode]

  public init(renderContext: SKRenderContext, scene: SCNScene) {
    self.renderContext = renderContext
    self.scene = scene
    self.nodeRegistry = [:]
  }

  /// Register a node by ID for later lookup (used by constraints, etc.)
  public func register(scnNode: SCNNode, for nodeId: String) {
    nodeRegistry[nodeId] = scnNode
  }

  /// Look up a previously registered node by ID
  public func node(for nodeId: String) -> SCNNode? {
    nodeRegistry[nodeId]
  }

  /// Render a child node (used by renderers to render children)
  public func renderNode(_ node: Node, messageHandler: MessageHandler?) -> SCNNode? {
    guard let renderer = renderContext.node(for: node.type) else { return nil }
    return renderer.render(node: node, context: self, messageHandler: messageHandler)
  }
}

struct SKRenderContextKey: EnvironmentKey {
  static let defaultValue = SKRenderContext.default
}

extension EnvironmentValues {
  public var skRenderContext: SKRenderContext {
    get { self[SKRenderContextKey.self] }
    set { self[SKRenderContextKey.self] = newValue }
  }
}
