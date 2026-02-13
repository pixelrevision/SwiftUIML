import SwiftUI

extension VerticalEdge.Set {
  /// Creates a VerticalEdge.Set from a string representation
  /// - Parameter string: The string value ("top", "bottom", or "all")
  /// - Returns: A VerticalEdge.Set value (defaults to .all if invalid)
  init(_ string: String) {
    switch string {
    case "top":
      self = .top
    case "bottom":
      self = .bottom
    case "all":
      self = .all
    default:
      self = .all
    }
  }
}
