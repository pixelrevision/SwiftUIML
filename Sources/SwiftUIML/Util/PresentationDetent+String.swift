import SwiftUI
import SwiftUIMLCore

extension PresentationDetent {
  /// Creates a presentation detent from a string value
  /// - Parameter string: The detent string ("medium" or "large")
  /// - Returns: The corresponding PresentationDetent, or nil if invalid
  init?(_ string: String) {
    switch string {
    case "medium":
      self = .medium
    case "large":
      self = .large
    default:
      return nil
    }
  }

  /// Creates a presentation detent from a dictionary
  /// - Parameter dict: Dictionary with "type" and optional "value"
  /// - Returns: The corresponding PresentationDetent, or nil if invalid
  init?(_ dict: [AttributeKey: AttributeValue]) {
    switch dict[.type]?.string {
    case "medium":
      self = .medium
    case "large":
      self = .large
    case "fraction":
      guard let fraction = dict[.value]?.cgFloat else { return nil }
      self = .fraction(fraction)
    case "height":
      guard let height = dict[.value]?.cgFloat else { return nil }
      self = .height(height)
    default:
      return nil
    }
  }
}
