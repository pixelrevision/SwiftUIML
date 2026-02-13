import Foundation

/// Represents an animation that can be applied to attribute changes
public indirect enum AnimationValue: Hashable, Sendable {
  case animation(
    type: AnimationType,
    parameters: [String: AttributeValue],
    next: AnimationValue?
  )

  public var type: AnimationType {
    switch self {
    case .animation(let type, _, _): return type
    }
  }

  public var parameters: [String: AttributeValue] {
    switch self {
    case .animation(_, let parameters, _): return parameters
    }
  }

  public var next: AnimationValue? {
    switch self {
    case .animation(_, _, let next): return next
    }
  }

  /// Create an animation value
  public init(type: AnimationType, parameters: [String: AttributeValue] = [:], next: AnimationValue? = nil) {
    self = .animation(type: type, parameters: parameters, next: next)
  }
}

extension AnimationValue {
  /// Convert this animation to an AttributeValue dictionary
  public func toAttributeValue() -> AttributeValue {
    var dict: [AttributeKey: AttributeValue] = [
      .type: .string(type.rawValue),
    ]
    // Add parameters
    for (key, value) in parameters {
      dict[AttributeKey(key)] = value
    }
    // Add next if present
    if let next = next {
      dict[.next] = next.toAttributeValue()
    }
    return .dict(dict)
  }

  /// Chain another animation after this one
  public func next(_ animation: AnimationValue) -> AnimationValue {
    if let existingNext = self.next {
      // Append to the end of the chain
      return AnimationValue(type: type, parameters: parameters, next: existingNext.next(animation))
    }
    else {
      return AnimationValue(type: type, parameters: parameters, next: animation)
    }
  }

  public func easeIn(duration: CGFloat = 0.35) -> AnimationValue {
    next(AnimationValue.easeIn(duration: duration))
  }

  public func easeOut(duration: CGFloat = 0.35) -> AnimationValue {
    next(AnimationValue.easeOut(duration: duration))
  }

  public func easeInOut(duration: CGFloat = 0.35) -> AnimationValue {
    next(AnimationValue.easeInOut(duration: duration))
  }

  public func linear(duration: CGFloat = 0.35) -> AnimationValue {
    next(AnimationValue.linear(duration: duration))
  }

  public func spring(
    response: CGFloat = 0.55,
    dampingFraction: CGFloat = 0.825,
    blendDuration: CGFloat = 0
  ) -> AnimationValue {
    next(AnimationValue.spring(response: response, dampingFraction: dampingFraction, blendDuration: blendDuration))
  }

  public func bouncy(duration: CGFloat = 0.5) -> AnimationValue {
    next(AnimationValue.bouncy(duration: duration))
  }

  public func smooth(duration: CGFloat = 0.5) -> AnimationValue {
    next(AnimationValue.smooth(duration: duration))
  }

  public func snappy(duration: CGFloat = 0.5) -> AnimationValue {
    next(AnimationValue.snappy(duration: duration))
  }

  public func delay(_ delay: CGFloat) -> AnimationValue {
    next(AnimationValue.delay(delay))
  }

  public func speed(_ speed: CGFloat) -> AnimationValue {
    next(AnimationValue.speed(speed))
  }

  public func repeatCount(_ count: Int, autoreverses: Bool = false) -> AnimationValue {
    next(AnimationValue.repeatCount(count, autoreverses: autoreverses))
  }

  public func repeatForever(autoreverses: Bool = false) -> AnimationValue {
    next(AnimationValue.repeatForever(autoreverses: autoreverses))
  }
}

extension AnimationValue {
  public static func easeIn(duration: CGFloat = 0.35) -> AnimationValue {
    AnimationValue(type: .easeIn, parameters: [AttributeKey.duration.rawValue: .number(Double(duration))])
  }

  public static func easeOut(duration: CGFloat = 0.35) -> AnimationValue {
    AnimationValue(type: .easeOut, parameters: [AttributeKey.duration.rawValue: .number(Double(duration))])
  }

  public static func easeInOut(duration: CGFloat = 0.35) -> AnimationValue {
    AnimationValue(type: .easeInOut, parameters: [AttributeKey.duration.rawValue: .number(Double(duration))])
  }

  public static func linear(duration: CGFloat = 0.35) -> AnimationValue {
    AnimationValue(type: .linear, parameters: [AttributeKey.duration.rawValue: .number(Double(duration))])
  }

  public static func spring(
    response: CGFloat = 0.55,
    dampingFraction: CGFloat = 0.825,
    blendDuration: CGFloat = 0
  ) -> AnimationValue {
    AnimationValue(type: .spring, parameters: [
      AttributeKey.response.rawValue: .number(Double(response)),
      AttributeKey.dampingFraction.rawValue: .number(Double(dampingFraction)),
      AttributeKey.blendDuration.rawValue: .number(Double(blendDuration)),
    ])
  }

  public static func bouncy(duration: CGFloat = 0.5) -> AnimationValue {
    AnimationValue(type: .bouncy, parameters: [AttributeKey.duration.rawValue: .number(Double(duration))])
  }

  public static func smooth(duration: CGFloat = 0.5) -> AnimationValue {
    AnimationValue(type: .smooth, parameters: [AttributeKey.duration.rawValue: .number(Double(duration))])
  }

  public static func snappy(duration: CGFloat = 0.5) -> AnimationValue {
    AnimationValue(type: .snappy, parameters: [AttributeKey.duration.rawValue: .number(Double(duration))])
  }

  public static func delay(_ delay: CGFloat) -> AnimationValue {
    AnimationValue(type: .delay, parameters: [AttributeKey.delay.rawValue: .number(Double(delay))])
  }

  public static func speed(_ speed: CGFloat) -> AnimationValue {
    AnimationValue(type: .speed, parameters: [AttributeKey.speed.rawValue: .number(Double(speed))])
  }

  public static func repeatCount(_ count: Int, autoreverses: Bool = false) -> AnimationValue {
    AnimationValue(type: .repeatCount, parameters: [
      AttributeKey.count.rawValue: .number(Double(count)),
      AttributeKey.autoreverses.rawValue: .bool(autoreverses),
    ])
  }

  public static func repeatForever(autoreverses: Bool = false) -> AnimationValue {
    AnimationValue(type: .repeatForever, parameters: [AttributeKey.autoreverses.rawValue: .bool(autoreverses)])
  }
}
