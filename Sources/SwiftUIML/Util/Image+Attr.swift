import SwiftUI
import SwiftUIMLCore
extension Image.TemplateRenderingMode {
  init?(_ attr: AttributeValue) {
    guard let value = attr.string else {
      return nil
    }
    switch value {
    case "template": self = .template
    case "original": self = .original
    default: return nil
    }
  }
}
