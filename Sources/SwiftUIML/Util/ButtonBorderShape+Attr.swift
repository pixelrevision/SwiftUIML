import SwiftUI
import SwiftUIMLCore

func ButtonBorderShape(_ value: AttributeValue) -> ButtonBorderShape? {
  guard let string = value.string else {
    return nil
  }
  switch string {
  case "automatic":
    return .automatic
  case "capsule":
    return .capsule
  case "roundedRectangle":
    return .roundedRectangle
  default:
    return nil
  }
}
