import SwiftUI
import SwiftUIMLCore

func ProgressViewStyle(_ value: AttributeValue) -> (any ProgressViewStyle)? {
  guard let string = value.string else {
    return nil
  }
  
  switch string {
  case "automatic":
    return .automatic
  case "linear":
    return .linear
  case "circular":
    return .circular
  default:
    return nil
  }
}
