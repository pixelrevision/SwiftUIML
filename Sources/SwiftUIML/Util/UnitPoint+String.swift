import SwiftUI
import SwiftUIMLCore
extension UnitPoint {
  init?(_ value: String?) {
    switch value {
    case "topLeading":
      self = .topLeading
    case "top":
      self = .top
    case "topTrailing":
      self = .topTrailing
    case "leading":
      self = .leading
    case "center":
      self = .center
    case "trailing":
      self = .trailing
    case "bottomLeading":
      self = .bottomLeading
    case "bottom":
      self = .bottom
    case "bottomTrailing":
      self = .bottomTrailing
    default:
      return nil
    }
  }
}
