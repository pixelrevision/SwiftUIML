import SwiftUI
import SwiftUIMLCore

extension NavigationBarItem.TitleDisplayMode {
  init?(_ value: AttributeValue) {
    switch value.string {
    case "automatic":
      self = .automatic
    case "inline":
      self = .inline
    case "large":
      self = .large
    default:
      return nil
    }
  }
}
