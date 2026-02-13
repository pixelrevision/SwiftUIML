import SwiftUI

extension Visibility {
  /// Creates a Visibility value from a string representation
  /// - Parameter string: The string value ("automatic", "visible", or "hidden")
  /// - Returns: A Visibility value, or nil if the string is invalid
  init?(_ string: String) {
    switch string {
    case "automatic":
      self = .automatic
    case "visible":
      self = .visible
    case "hidden":
      self = .hidden
    default:
      return nil
    }
  }
}
