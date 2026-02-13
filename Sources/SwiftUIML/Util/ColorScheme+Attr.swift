import SwiftUI
import SwiftUIMLCore

extension ColorScheme {
  init?(_ value: AttributeValue) {
    switch value.string {
    case "light":
      self = .light
    case "dark":
      self = .dark
    default:
      return nil
    }
  }
}
