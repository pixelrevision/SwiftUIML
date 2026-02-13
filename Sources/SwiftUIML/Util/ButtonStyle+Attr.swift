import SwiftUI
import SwiftUIMLCore

func ButtonStyle(_ value: AttributeValue) -> (any PrimitiveButtonStyle)? {
  switch value.string {
  case "automatic":
    return DefaultButtonStyle()
  case "plain":
    return PlainButtonStyle()
  case "bordered":
    return BorderedButtonStyle()
  case "borderedProminent":
    return BorderedProminentButtonStyle()
  case "borderless":
    return BorderlessButtonStyle()
  default:
    return nil
  }
}
