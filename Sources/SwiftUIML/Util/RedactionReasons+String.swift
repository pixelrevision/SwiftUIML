import SwiftUI

extension SwiftUI.RedactionReasons {
  /// Creates a RedactionReasons value from a string representation
  /// - Parameter string: The string value ("placeholder" or "privacy")
  /// - Returns: A RedactionReasons value, or nil if the string is invalid
  init?(_ string: String) {
    switch string {
    case "placeholder":
      self = .placeholder
    case "privacy":
      self = .privacy
    default:
      return nil
    }
  }
}
