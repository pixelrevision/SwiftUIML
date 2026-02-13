import Foundation

@resultBuilder
public struct NodeBuilder {
  // Build block from multiple components
  public static func buildBlock(_ components: [Node]...) -> [Node] {
    components.flatMap { $0 }
  }

  // Support for arrays (ForEachNode)
  public static func buildArray(_ components: [[Node]]) -> [Node] {
    components.flatMap { $0 }
  }
  
  // Support for if statements
  public static func buildOptional(_ component: [Node]?) -> [Node] {
    component ?? []
  }
  
  // Support for if-else statements (first branch)
  public static func buildEither(first component: [Node]) -> [Node] {
    component
  }
  
  // Support for if-else statements (second branch)
  public static func buildEither(second component: [Node]) -> [Node] {
    component
  }
  
  // Support for single Node in blocks
  public static func buildExpression(_ expression: Node) -> [Node] {
    [expression]
  }
  
  // Support for array of Nodes (from ForEachNode)
  public static func buildExpression(_ expression: [Node]) -> [Node] {
    expression
  }
}
