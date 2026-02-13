import SwiftUI
import SwiftUIMLCore

extension AccessibilityChildBehavior {
  init?(_ value: AttributeValue) {
    switch value.string {
    case "contain":
      self = .contain
    case "ignore":
      self = .ignore
    case "combine":
      self = .combine
    default:
      return nil
    }
  }
}
