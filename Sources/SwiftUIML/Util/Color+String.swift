import SwiftUI
import SwiftUIMLCore
extension Color {
  init?(_ value: AttributeValue) {
    guard let value = value.string else {
      self = .clear
      return
    }
    self.init(value)
  }
  
  // swiftlint:disable:next cyclomatic_complexity
  init(_ value: String) {
    switch value {
    // Basic SwiftUI colors
    case "red": self = .red
    case "blue": self = .blue
    case "green": self = .green
    case "black": self = .black
    case "white": self = .white
    case "gray": self = .gray
    case "orange": self = .orange
    case "yellow": self = .yellow
    case "purple": self = .purple
    case "pink": self = .pink
    case "primary": self = .primary
    case "secondary": self = .secondary
    case "clear": self = .clear

    // Adaptive label colors
    case "label": self = Color(uiColor: .label)
    case "secondaryLabel": self = Color(uiColor: .secondaryLabel)
    case "tertiaryLabel": self = Color(uiColor: .tertiaryLabel)
    case "quaternaryLabel": self = Color(uiColor: .quaternaryLabel)

    // Adaptive background colors
    case "systemBackground": self = Color(uiColor: .systemBackground)
    case "secondarySystemBackground": self = Color(uiColor: .secondarySystemBackground)
    case "tertiarySystemBackground": self = Color(uiColor: .tertiarySystemBackground)

    // Adaptive grouped background colors
    case "systemGroupedBackground": self = Color(uiColor: .systemGroupedBackground)
    case "secondarySystemGroupedBackground": self = Color(uiColor: .secondarySystemGroupedBackground)
    case "tertiarySystemGroupedBackground": self = Color(uiColor: .tertiarySystemGroupedBackground)

    // Adaptive fill colors
    case "systemFill": self = Color(uiColor: .systemFill)
    case "secondarySystemFill": self = Color(uiColor: .secondarySystemFill)
    case "tertiarySystemFill": self = Color(uiColor: .tertiarySystemFill)
    case "quaternarySystemFill": self = Color(uiColor: .quaternarySystemFill)

    // Separator colors
    case "separator": self = Color(uiColor: .separator)
    case "opaqueSeparator": self = Color(uiColor: .opaqueSeparator)

    // Link color
    case "link": self = Color(uiColor: .link)

    // Adaptive system colors
    case "systemRed": self = Color(uiColor: .systemRed)
    case "systemBlue": self = Color(uiColor: .systemBlue)
    case "systemGreen": self = Color(uiColor: .systemGreen)
    case "systemOrange": self = Color(uiColor: .systemOrange)
    case "systemYellow": self = Color(uiColor: .systemYellow)
    case "systemPink": self = Color(uiColor: .systemPink)
    case "systemPurple": self = Color(uiColor: .systemPurple)
    case "systemTeal": self = Color(uiColor: .systemTeal)
    case "systemIndigo": self = Color(uiColor: .systemIndigo)
    case "systemBrown": self = Color(uiColor: .systemBrown)
    case "systemMint": self = Color(uiColor: .systemMint)
    case "systemCyan": self = Color(uiColor: .systemCyan)

    // System gray colors
    case "systemGray": self = Color(uiColor: .systemGray)
    case "systemGray2": self = Color(uiColor: .systemGray2)
    case "systemGray3": self = Color(uiColor: .systemGray3)
    case "systemGray4": self = Color(uiColor: .systemGray4)
    case "systemGray5": self = Color(uiColor: .systemGray5)
    case "systemGray6": self = Color(uiColor: .systemGray6)

    // Fallback to hex parsing
    default: self = HexColor.color(from: value)
    }
  }
}

private struct HexColor {
  /// Create a Color from a hex string, supporting optional alpha and dark/light mode variations
  /// Format examples:
  /// - "#FF0000" (simple hex, fully opaque)
  /// - "#FF0000FF" (hex with alpha, fully opaque)
  /// - "#FF000080" (hex with alpha, 50% transparent)
  /// - "#FF0000:#000000" (light:dark mode variants)
  static func color(from hexString: String) -> Color {
    // Check if we have light/dark variants
    let components = hexString.split(separator: ":")
    
    if components.count == 2 {
      // We have light/dark variants
      let lightVariant = String(components[0])
      let darkVariant = String(components[1])
      
      // Use dynamicProvider to create a UIColor that changes based on trait collection
      let dynamicColor = UIColor { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
          return colorFromHex(darkVariant)
        case .light, .unspecified:
          return colorFromHex(lightVariant)
        @unknown default:
          return colorFromHex(lightVariant)
        }
      }
      return Color(uiColor: dynamicColor)
    }
    else {
      // Single color for both modes
      return Color(uiColor: colorFromHex(hexString))
    }
  }
  
  /// Convert hex string to UIColor
  private static func colorFromHex(_ hex: String) -> UIColor {
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
    
    var rgb: UInt64 = 0
    Scanner(string: hexSanitized).scanHexInt64(&rgb)
    
    if hexSanitized.count == 8 {
      // #RRGGBBAA format
      let r = Double((rgb & 0xFF000000) >> 24) / 255.0
      let g = Double((rgb & 0x00FF0000) >> 16) / 255.0
      let b = Double((rgb & 0x0000FF00) >> 8) / 255.0
      let a = Double(rgb & 0x000000FF) / 255.0
      
      return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
    }
    else if hexSanitized.count == 6 {
      // #RRGGBB format
      let r = Double((rgb & 0xFF0000) >> 16) / 255.0
      let g = Double((rgb & 0x00FF00) >> 8) / 255.0
      let b = Double(rgb & 0x0000FF) / 255.0
      
      return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
    }
    else {
      // Invalid format, return a default color
      return .lightGray
    }
  }
  
  /// Get color from an attribute dictionary
  static func color(from attributes: [String: String], for key: String) -> Color? {
    guard let value = attributes[key] else {
      return nil
    }
    return color(from: value)
  }
}
