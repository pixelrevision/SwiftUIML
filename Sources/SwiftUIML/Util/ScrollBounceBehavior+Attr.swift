import SwiftUI
import SwiftUIMLCore
extension ScrollBounceBehavior {
  init(_ value: AttributeValue) {
    if let stringValue = value.string {
      self = Self.behavior(from: stringValue)
      return
    }
    if let dictValue = value.dict?[.behavior]?.string {
      self = Self.behavior(from: dictValue)
      return
    }
    self = .always
  }

  private static func behavior(from value: String) -> ScrollBounceBehavior {
    switch value {
    case "automatic":
      return .automatic
    case "always":
      return .always
    case "basedOnSize":
      return .basedOnSize
    default:
      return .always
    }
  }
}
