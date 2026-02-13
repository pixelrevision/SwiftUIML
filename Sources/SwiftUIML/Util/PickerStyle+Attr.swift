import SwiftUI
import SwiftUIMLCore

func PickerStyle(_ value: AttributeValue) -> (any PickerStyle)? {
  switch value.string {
  case "automatic":
    return .automatic
  case "inline":
    return .inline
  case "menu":
    return .menu
  case "navigationLink":
    return .navigationLink
  case "palette":
    return .palette
  case "segmented":
    return .segmented
  case "wheel":
    return .wheel
  default:
    return nil
  }
}
