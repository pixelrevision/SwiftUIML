import SwiftUI
import SwiftUIMLCore
extension Alignment {
  init(_ value: String?) {
    guard let value else {
      self = .center
      return
    }
    switch value {
    case "topLeading": self = .topLeading
    case "top": self = .top
    case "topTrailing": self = .topTrailing
    case "leading": self = .leading
    case "center": self = .center
    case "trailing": self = .trailing
    case "bottomLeading": self = .bottomLeading
    case "bottom": self = .bottom
    case "bottomTrailing": self = .bottomTrailing
    default: self = .center
    }
  }
}

extension VerticalAlignment {
  init(_ value: String?) {
    guard let value else {
      self = .center
      return
    }
    switch value {
    case "top": self = .top
    case "center": self = .center
    case "bottom": self = .bottom
    default: self = .center
    }
  }
}

extension HorizontalAlignment {
  init(_ value: String?) {
    guard let value else {
      self = .center
      return
    }
    switch value {
    case "leading": self = .leading
    case "center": self = .center
    case "trailing": self = .trailing
    default: self = .center
    }
  }
}
