import SwiftUI
import SwiftUIMLCore

func ListStyle(_ value: AttributeValue) -> (any ListStyle)? {
  switch value.string {
  case "automatic":
    return .automatic
  case "plain":
    return .plain
  case "grouped":
    return .grouped
  case "inset":
    return .inset
  case "insetGrouped":
    return .insetGrouped
  case "sidebar":
    return .sidebar
  default:
    return nil
  }
}
