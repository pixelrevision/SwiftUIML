import SwiftUI
import SwiftUIMLCore

extension UIKeyboardType {
  init?(_ value: AttributeValue) {
    switch value.string {
    case "default":
      self = .default
    case "asciiCapable":
      self = .asciiCapable
    case "numbersAndPunctuation":
      self = .numbersAndPunctuation
    case "URL":
      self = .URL
    case "numberPad":
      self = .numberPad
    case "phonePad":
      self = .phonePad
    case "namePhonePad":
      self = .namePhonePad
    case "emailAddress":
      self = .emailAddress
    case "decimalPad":
      self = .decimalPad
    case "twitter":
      self = .twitter
    case "webSearch":
      self = .webSearch
    case "asciiCapableNumberPad":
      self = .asciiCapableNumberPad
    default:
      return nil
    }
  }
}
