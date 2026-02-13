import SwiftUI
import SwiftUIMLCore

extension Angle {
  init?(_ attr: AttributeValue) {
    if let degrees = attr.dict?[.degrees]?.cgFloat {
      self = .degrees(degrees)
    }
    else if let radians = attr.dict?[.radians]?.cgFloat {
      self = .radians(radians)
    }
    else if attr.dict?[.zero] != nil {
      self = .zero
    }
    else if let degrees = attr.cgFloat {
      self = .degrees(degrees)
    }
    else {
      return nil
    }
  }
}
