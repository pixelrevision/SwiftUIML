import SwiftUI
import SwiftUIMLCore
extension Axis.Set {
  init(_ attr: AttributeValue?) {
    guard let attr else {
      self = .vertical
      return
    }
    if let stringValue = attr.string {
      self = Self.axis(from: stringValue)
      return
    }
    if let arrayValue = attr.array {
      self = Self.axis(from: arrayValue)
      return
    }
    self = .vertical
  }

  private static func axis(from string: String) -> Axis.Set {
    switch string {
    case "vertical": .vertical
    case "horizontal": .horizontal
    default: .vertical
    }
  }

  private static func axis(from items: [AttributeValue]) -> Axis.Set {
    var set = Axis.Set()
    for item in items {
      if let value = item.string {
        set.insert(Self.axis(from: value))
      }
    }
    return set
  }
}
