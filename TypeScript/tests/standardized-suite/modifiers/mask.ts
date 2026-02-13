/**
 * Mask modifier test definitions
 * Must match Swift MaskTests.swift
 */
import { Node, Color, LinearGradient, Circle, RoundedRectangle, Capsule } from "../../../src/index";

export function generateMaskTests(): Record<string, Node> {
  return {
    "modifier.mask.circle": Color("#007AFF:#0A84FF").frame(100, 100).mask(Circle()),

    "modifier.mask.rounded-rectangle": LinearGradient(
      ["#FF3B30:#FF453A", "#007AFF:#0A84FF"],
      "topLeading",
      "bottomTrailing",
    )
      .frame(100, 100)
      .mask(RoundedRectangle(20)),

    "modifier.mask.capsule": LinearGradient(
      ["#FF3B30:#FF453A", "#34C759:#30D158"],
      "leading",
      "trailing",
    )
      .frame(80, 60)
      .mask(Capsule()),
  };
}
