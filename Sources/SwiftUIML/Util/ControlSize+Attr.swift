import SwiftUI
import SwiftUIMLCore

extension ControlSize {
  init?(_ value: AttributeValue) {
    switch value.string {
    case "mini":
      self = .mini
    case "small":
      self = .small
    case "regular":
      self = .regular
    case "large":
      self = .large
    case "extraLarge":
      self = .extraLarge
    default:
      return nil
    }
  }
}
