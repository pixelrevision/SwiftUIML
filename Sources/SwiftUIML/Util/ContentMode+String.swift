import SwiftUI
import SwiftUIMLCore
extension ContentMode {
  init(_ value: String?) {
    guard let value else {
      self = .fit
      return
    }
    switch value {
    case "fill":
      self = .fill
    case "fit":
      self = .fit
    default:
      self = .fit
    }
  }
}
