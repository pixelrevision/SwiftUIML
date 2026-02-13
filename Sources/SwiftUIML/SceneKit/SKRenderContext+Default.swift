//
//  SKRenderContext+Default.swift
//  SwiftUIML
//
//  Created by Malcolm.Wilson on 10/31/25.
//

import SwiftUIMLCore

extension SKRenderContext {
  public static let `default` = SKRenderContext(
    modifiers: Dictionary(
      uniqueKeysWithValues: [
        // Transform modifiers
        SKPositionModifierRenderer.self,
        SKRotationModifierRenderer.self,
        SKScaleModifierRenderer.self,
        // Visual properties
        SKHiddenModifierRenderer.self,
        SKOpacityModifierRenderer.self,
        // Material properties
        SKDiffuseModifierRenderer.self,
        SKSpecularModifierRenderer.self,
        SKEmissionModifierRenderer.self,
        SKAmbientModifierRenderer.self,
        SKShininessModifierRenderer.self,
        SKRoughnessModifierRenderer.self,
        SKMetalnessModifierRenderer.self,
        // Texture-only modifiers (normal and AO don't have value-based equivalents)
        SKNormalModifierRenderer.self,
        SKAmbientOcclusionModifierRenderer.self,
      ].map { ($0.key, $0) }
    ),
    nodes: Dictionary(
      uniqueKeysWithValues: [
        // Geometry nodes
        SKCubeRenderer.self,
        SKSphereRenderer.self,
        SKCylinderRenderer.self,
        SKConeRenderer.self,
        SKPlaneRenderer.self,
        SKTorusRenderer.self,
        SKCapsuleRenderer.self,
        SKPyramidRenderer.self,
        // Container nodes
        SKGroupRenderer.self,
        // Camera & Lighting
        SKCameraRenderer.self,
        SKLightRenderer.self,
      ].map { ($0.type, $0) }
    )
  )
}
