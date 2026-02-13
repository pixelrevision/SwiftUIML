//
//  SKLightNode.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 11/1/25.
//

/// Creates a SceneKit light node
public func SKLightNode(
  type: Node.LightType = .omni,
  color: String = "#FFFFFF",
  intensity: Double = 1000.0,
  temperature: Double? = nil,
  castsShadow: Bool = false,
  shadowRadius: Double = 3.0,
  shadowColor: String = "#000000",
  spotInnerAngle: Double? = nil,
  spotOuterAngle: Double? = nil
) -> Node {
  var attributes: [(AttributeKey, AttributeValue)] = [
    (.lightType, .string(type.rawValue)),
    (.color, .string(color)),
    (.intensity, .number(intensity)),
    (.castsShadow, .bool(castsShadow)),
    (.shadowRadius, .number(shadowRadius)),
    (.shadowColor, .string(shadowColor)),
  ]

  if let temp = temperature {
    attributes.append((.temperature, .number(temp)))
  }

  if let innerAngle = spotInnerAngle {
    attributes.append((.spotInnerAngle, .number(innerAngle)))
  }

  if let outerAngle = spotOuterAngle {
    attributes.append((.spotOuterAngle, .number(outerAngle)))
  }

  return Node(
    type: .skLight,
    attributes: OrderedMultiDictionary(attributes)
  )
}

// Convenience functions for specific light types

/// Creates an omni/point light that radiates in all directions
public func SKOmniLightNode(
  color: String = "#FFFFFF",
  intensity: Double = 1000.0,
  castsShadow: Bool = false
) -> Node {
  return SKLightNode(
    type: .omni,
    color: color,
    intensity: intensity,
    castsShadow: castsShadow
  )
}

/// Creates a directional light with parallel rays (like the sun)
public func SKDirectionalLightNode(
  color: String = "#FFFFFF",
  intensity: Double = 1000.0,
  castsShadow: Bool = true
) -> Node {
  return SKLightNode(
    type: .directional,
    color: color,
    intensity: intensity,
    castsShadow: castsShadow
  )
}

/// Creates a spotlight with a cone of light
public func SKSpotLightNode(
  color: String = "#FFFFFF",
  intensity: Double = 1000.0,
  innerAngle: Double = 0.0,
  outerAngle: Double = 45.0,
  castsShadow: Bool = true
) -> Node {
  return SKLightNode(
    type: .spot,
    color: color,
    intensity: intensity,
    castsShadow: castsShadow,
    spotInnerAngle: innerAngle,
    spotOuterAngle: outerAngle
  )
}

/// Creates an ambient light for global soft illumination
public func SKAmbientLightNode(
  color: String = "#FFFFFF",
  intensity: Double = 100.0
) -> Node {
  return SKLightNode(
    type: .ambient,
    color: color,
    intensity: intensity,
    castsShadow: false  // Ambient lights don't cast shadows
  )
}
