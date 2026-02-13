import SwiftUI
import SwiftUIMLCore

func ToggleStyle(_ value: AttributeValue) -> (any ToggleStyle)? {
  switch value.string {
  case "automatic":
    return .automatic
  case "switch":
    return .switch
  case "button":
    return .button
  default:
    return nil
  }
}
