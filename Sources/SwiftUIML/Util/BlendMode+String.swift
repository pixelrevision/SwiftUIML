import SwiftUI

extension SwiftUI.BlendMode {
  /// Creates a BlendMode from a string representation
  /// - Parameter string: The blend mode name
  /// - Returns: A BlendMode value, or nil if the string is invalid
  init?(_ string: String) { // swiftlint:disable:this cyclomatic_complexity
    switch string {
    case "normal":
      self = .normal
    case "multiply":
      self = .multiply
    case "screen":
      self = .screen
    case "overlay":
      self = .overlay
    case "darken":
      self = .darken
    case "lighten":
      self = .lighten
    case "colorDodge":
      self = .colorDodge
    case "colorBurn":
      self = .colorBurn
    case "softLight":
      self = .softLight
    case "hardLight":
      self = .hardLight
    case "difference":
      self = .difference
    case "exclusion":
      self = .exclusion
    case "hue":
      self = .hue
    case "saturation":
      self = .saturation
    case "color":
      self = .color
    case "luminosity":
      self = .luminosity
    case "sourceAtop":
      self = .sourceAtop
    case "destinationOver":
      self = .destinationOver
    case "destinationOut":
      self = .destinationOut
    case "plusDarker":
      self = .plusDarker
    case "plusLighter":
      self = .plusLighter
    default:
      return nil
    }
  }
}
