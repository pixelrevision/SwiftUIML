import Foundation

/// Creates an array of nodes by iterating over a collection
/// - Parameters:
///   - data: The collection to iterate over
///   - content: A closure that creates nodes for each element
/// - Returns: An array of nodes
public func ForEachNode<Data: Collection>(
  _ data: Data,
  @NodeBuilder content: (Data.Element) -> [Node]
) -> [Node] {
  data.flatMap(content)
}

/// Creates an array of nodes by iterating over a collection with an index
/// - Parameters:
///   - data: The collection to iterate over
///   - content: A closure that creates nodes for each element and index
/// - Returns: An array of nodes
public func ForEachNode<Data: Collection>(
  _ data: Data,
  @NodeBuilder content: (Int, Data.Element) -> [Node]
) -> [Node] {
  data.enumerated().flatMap { index, element in
    content(index, element)
  }
}

/// Creates an array of nodes by iterating over a range
/// - Parameters:
///   - range: The range to iterate over
///   - content: A closure that creates nodes for each value
/// - Returns: An array of nodes
public func ForEachNode(
  _ range: Range<Int>,
  @NodeBuilder content: (Int) -> [Node]
) -> [Node] {
  range.flatMap(content)
}

/// Creates an array of nodes by iterating over a closed range
/// - Parameters:
///   - range: The closed range to iterate over
///   - content: A closure that creates nodes for each value
/// - Returns: An array of nodes
public func ForEachNode(
  _ range: ClosedRange<Int>,
  @NodeBuilder content: (Int) -> [Node]
) -> [Node] {
  range.flatMap(content)
}
