/**
 * Contrast modifier test definitions
 * Must match Swift ContrastTests.swift
 */
import { Node, HStack, VStack, Text, LinearGradient, Image } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

const gradientColors = [
  "#FF3B30:#FF453A",
  "#FF9500:#FF9F0A",
  "#FFCC00:#FFD60A",
  "#34C759:#30D158",
  "#007AFF:#0A84FF",
  "#5856D6:#5E5CE6",
];

export function generateContrastTests(): Record<string, Node> {
  return {
    "modifier.contrast.variations": HStack(16, undefined, [
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("0.0").font(10),
      ]).contrast(0.0),

      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("0.5").font(10),
      ]).contrast(0.5),

      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("1.0").font(10),
      ]).contrast(1.0),

      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("2.0").font(10),
      ]).contrast(2.0),
    ]),

    "modifier.contrast.on-image": HStack(20, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80).contrast(0.5),
        Text("Low").font(12),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80).contrast(2.0),
        Text("High").font(12),
      ]),
    ]),
  };
}
