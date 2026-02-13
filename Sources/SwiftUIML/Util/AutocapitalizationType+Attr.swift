import SwiftUI
import SwiftUIMLCore

extension UITextAutocapitalizationType {
  init?(_ value: AttributeValue) {
    switch value.string {
    case "none":
      self = .none
    case "words":
      self = .words
    case "sentences":
      self = .sentences
    case "allCharacters":
      self = .allCharacters
    default:
      return nil
    }
  }
}
