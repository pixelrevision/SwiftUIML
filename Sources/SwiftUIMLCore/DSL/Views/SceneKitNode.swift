/// Creates a SceneKit view node
public func SceneKitNode(@NodeBuilder content: () -> [Node] = { [] }) -> Node {
  return Node(type: .sceneKit, attributes: [:], children: content())
}
