import SwiftUI
import SwiftUIMLCore
extension Font.Weight {
  init?(_ value: String?) {
    switch value {
    case "ultraLight": self = .ultraLight
    case "thin": self = .thin
    case "light": self = .light
    case "regular": self = .regular
    case "medium": self = .medium
    case "semibold": self = .semibold
    case "bold": self = .bold
    case "heavy": self = .heavy
    case "black": self = .black
    default: return nil
    }
  }
}

extension Font.Design {
  init?(_ value: String?) {
    switch value {
    case "default": self = .default
    case "serif": self = .serif
    case "rounded": self = .rounded
    case "monospaced": self = .monospaced
    default: return nil
    }
  }
}

extension Font.TextStyle {
  init?(_ value: String?) {
    switch value {
    case "largeTitle": self = .largeTitle
    case "title": self = .title
    case "title2": self = .title2
    case "title3": self = .title3
    case "headline": self = .headline
    case "subheadline": self = .subheadline
    case "body": self = .body
    case "callout": self = .callout
    case "footnote": self = .footnote
    case "caption": self = .caption
    case "caption2": self = .caption2
    default: return nil
    }
  }
}
