import SwiftUI
import SwiftUIMLCore
extension AccessibilityTraits {
  init?(_ value: String) {
    switch value {
    case "isButton":
      self = .isButton
    case "isHeader":
      self = .isHeader
    case "isSelected":
      self = .isSelected
    case "isLink":
      self = .isLink
    case "isSearchField":
      self = .isSearchField
    case "isImage":
      self = .isImage
    case "playsSound":
      self = .playsSound
    case "startsMediaSession":
      self = .startsMediaSession
    case "updatesFrequently":
      self = .updatesFrequently
    case "allowsDirectInteraction":
      self = .allowsDirectInteraction
    case "causesPageTurn":
      self = .causesPageTurn
    default:
      return nil
    }
  }
}
