/**
 * Overlay modifier test definitions
 * Must match Swift OverlayTests.swift
 */
import { Node, Color, Text, Circle, RoundedRectangle, ImageSystemName } from "../../../src/index";

export function generateOverlayTests(): Record<string, Node> {
  return {
    "modifier.overlay.centered": Color("#007AFF33:#0A84FF33")
      .frame(100, 100)
      .overlay(Text("Overlay").padding(8).background(Color("#000000BB:#FFFFFFBB")).cornerRadius(6)),

    "modifier.overlay.top-leading": Color("#007AFF33:#0A84FF33")
      .frame(100, 100)
      .overlay(Circle().fill("#FF3B30:#FF453A").frame(20, 20), "topLeading"),

    "modifier.overlay.bottom-trailing": Color("#34C75933:#30D15833")
      .frame(100, 100)
      .overlay(Circle().fill("#FF9500:#FF9F0A").frame(20, 20), "bottomTrailing"),

    "modifier.overlay.icon": RoundedRectangle(12)
      .fill("#5856D633:#5E5CE633")
      .frame(80, 80)
      .overlay(ImageSystemName("star.fill").foregroundColor("#FFD60A:#FFD60A")),
  };
}
