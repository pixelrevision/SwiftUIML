import SwiftUI
import SwiftUIMLCore

extension Text.TruncationMode {
  init?(_ value: AttributeValue) {
    guard let string = value.string else {
      return nil
    }
    switch string {
    case "head": self = .head
    case "tail": self = .tail
    case "middle": self = .middle
    default: return nil
    }
  }
}
