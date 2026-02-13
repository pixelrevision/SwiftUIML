/// Animation types supported by SwiftUIML
public enum AnimationType: String, Codable, Hashable, Sendable {
  // Base animations - timing curves
  case easeIn
  case easeOut
  case easeInOut
  case linear
  // Base animations - spring
  case spring
  case bouncy
  case smooth
  case snappy
  // Animation modifiers
  case delay
  case speed
  case repeatCount
  case repeatForever
}
