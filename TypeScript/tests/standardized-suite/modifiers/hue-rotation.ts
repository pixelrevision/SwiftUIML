/**
 * HueRotation modifier test definitions
 * Must match Swift HueRotationTests.swift
 */
import { Node, HStack, VStack, LinearGradient, Image, Text } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

const gradientColors = [
  "#FF3B30:#FF453A",
  "#FF9500:#FF9F0A",
  "#FFCC00:#FFD60A",
  "#34C759:#30D158",
  "#007AFF:#0A84FF",
  "#5856D6:#5E5CE6",
];

export function generateHueRotationTests(): Record<string, Node> {
  return {
    "modifier.hue-rotation.variations": HStack(16, undefined, [
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("0°").font(10),
      ]).hueRotation(0),
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("90°").font(10),
      ]).hueRotation(90),
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("180°").font(10),
      ]).hueRotation(180),
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("270°").font(10),
      ]).hueRotation(270),
    ]),

    "modifier.hue-rotation.on-image": HStack(20, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80),
        Text("Original").font(12),
      ]),
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80).hueRotation(180),
        Text("180° Rotated").font(12),
      ]),
    ]),
  };
}
