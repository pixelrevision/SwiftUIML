import SwiftUI
import SwiftUIMLCore

extension SubmitLabel {
  init?(_ value: AttributeValue) {
    switch value.string {
    case "done":
      self = .done
    case "go":
      self = .go
    case "send":
      self = .send
    case "join":
      self = .join
    case "route":
      self = .route
    case "search":
      self = .search
    case "return":
      self = .return
    case "next":
      self = .next
    case "continue":
      self = .continue
    default:
      return nil
    }
  }
}
