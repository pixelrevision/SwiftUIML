import SwiftUI
import SwiftUIMLCore

func ButtonRole(_ value: String?) -> SwiftUI.ButtonRole? {
  guard let value = value else { return nil }
  switch value {
  case "cancel":
    return .cancel
  case "destructive":
    return .destructive
  default:
    return nil
  }
}
