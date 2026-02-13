import SwiftUI
import SwiftUIMLCore

extension Edge.Set {
  init?(string: String) {
    switch string {
    case "all":
      self = .all
    case "top":
      self = .top
    case "bottom":
      self = .bottom
    case "leading":
      self = .leading
    case "trailing":
      self = .trailing
    case "horizontal":
      self = .horizontal
    case "vertical":
      self = .vertical
    default:
      return nil
    }
  }
}

extension VerticalEdge {
  init?(_ value: AttributeValue) {
    guard let string = value.string else {
      return nil
    }
    switch string {
    case "top":
      self = .top
    case "bottom":
      self = .bottom
    default:
      return nil
    }
  }
}
