import SwiftUI
import SwiftUIMLCore

extension Animation {
  /// Create a SwiftUI Animation from an AnimationValue
  static func from(_ animationValue: AttributeValue) -> Animation? {
    guard let dict = animationValue.dict else {
      return nil
    }

    // Verify type is actually a string (no coercion)
    guard case let .string(typeString) = dict[.type] else {
      return nil
    }

    // Parse animation type
    guard let animationType = AnimationType(rawValue: typeString) else {
      return nil
    }

    // Build base animation
    var animation: Animation = baseAnimation(for: animationType, parameters: dict)

    // Apply chained modifiers
    if let next = dict[.next] {
      animation = applyModifiers(to: animation, from: next)
    }

    return animation
  }

  private static func baseAnimation(for type: AnimationType, parameters: [AttributeKey: AttributeValue]) -> Animation {
    switch type {
    case .easeIn:
      let duration = parameters[.duration]?.cgFloat ?? 0.35
      return .easeIn(duration: duration)
    case .easeOut:
      let duration = parameters[.duration]?.cgFloat ?? 0.35
      return .easeOut(duration: duration)
    case .easeInOut:
      let duration = parameters[.duration]?.cgFloat ?? 0.35
      return .easeInOut(duration: duration)
    case .linear:
      let duration = parameters[.duration]?.cgFloat ?? 0.35
      return .linear(duration: duration)
    case .spring:
      let response = parameters[.response]?.cgFloat ?? 0.55
      let dampingFraction = parameters[.dampingFraction]?.cgFloat ?? 0.825
      let blendDuration = parameters[.blendDuration]?.cgFloat ?? 0.0
      return .spring(
        response: response,
        dampingFraction: dampingFraction,
        blendDuration: blendDuration
      )
    case .bouncy:
      let duration = parameters[.duration]?.cgFloat ?? 0.5
      return .bouncy(duration: duration)
    case .smooth:
      let duration = parameters[.duration]?.cgFloat ?? 0.5
      return .smooth(duration: duration)
    case .snappy:
      let duration = parameters[.duration]?.cgFloat ?? 0.5
      return .snappy(duration: duration)
    case .delay:
      let delay = parameters[.delay]?.cgFloat ?? 0.0
      return .default.delay(delay)
    case .speed:
      let speed = parameters[.speed]?.cgFloat ?? 1.0
      return .default.speed(speed)
    case .repeatCount:
      let count = parameters[.count]?.int ?? 1
      let autoreverses = parameters[.autoreverses]?.bool ?? false
      return .default.repeatCount(count, autoreverses: autoreverses)
    case .repeatForever:
      let autoreverses = parameters[.autoreverses]?.bool ?? false
      return .default.repeatForever(autoreverses: autoreverses)
    }
  }

  private static func applyModifiers(to animation: Animation, from attributeValue: AttributeValue) -> Animation {
    guard let dict = attributeValue.dict else {
      return animation
    }

    // Verify type is actually a string (no coercion)
    guard case let .string(typeString) = dict[.type] else {
      return animation
    }

    // Parse animation type
    guard let animationType = AnimationType(rawValue: typeString) else {
      return animation
    }

    var modifiedAnimation = animation

    switch animationType {
    case .delay:
      let delay = dict[.delay]?.cgFloat ?? 0.0
      modifiedAnimation = modifiedAnimation.delay(delay)
    case .speed:
      let speed = dict[.speed]?.cgFloat ?? 1.0
      modifiedAnimation = modifiedAnimation.speed(speed)
    case .repeatCount:
      let count = dict[.count]?.int ?? 1
      let autoreverses = dict[.autoreverses]?.bool ?? false
      modifiedAnimation = modifiedAnimation.repeatCount(count, autoreverses: autoreverses)
    case .repeatForever:
      let autoreverses = dict[.autoreverses]?.bool ?? false
      modifiedAnimation = modifiedAnimation.repeatForever(autoreverses: autoreverses)
    default:
      // Base animations shouldn't appear as modifiers, but ignore them gracefully
      break
    }
    // Recursively apply next modifiers
    if let next = dict[.next] {
      modifiedAnimation = applyModifiers(to: modifiedAnimation, from: next)
    }
    return modifiedAnimation
  }
}
