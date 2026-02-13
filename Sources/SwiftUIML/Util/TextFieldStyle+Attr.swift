import SwiftUI
import SwiftUIMLCore

func TextFieldStyle(_ value: AttributeValue) -> (any TextFieldStyle)? {
  switch value.string {
  case "automatic":
    return .automatic
  case "plain":
    return .plain
  case "roundedBorder":
    return .roundedBorder
  default:
    return nil
  }
}
