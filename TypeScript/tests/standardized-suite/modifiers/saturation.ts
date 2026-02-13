/**
 * Saturation modifier test definitions
 * Must match Swift SaturationTests.swift
 */
import { Node, HStack, VStack, LinearGradient, Image, Text } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generateSaturationTests(): Record<string, Node> {
  const gradientColors = [
    "#FF3B30:#FF453A",
    "#FF9500:#FF9F0A",
    "#FFCC00:#FFD60A",
    "#34C759:#30D158",
    "#007AFF:#0A84FF",
    "#5856D6:#5E5CE6",
  ];

  return {
    "modifier.saturation.variations": HStack(16, undefined, [
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("0.0").font(10),
      ]).saturation(0.0),
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("0.5").font(10),
      ]).saturation(0.5),
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("1.0").font(10),
      ]).saturation(1.0),
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("2.0").font(10),
      ]).saturation(2.0),
    ]),

    "modifier.saturation.on-image": HStack(20, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80).saturation(0.0),
        Text("Desaturated").font(12),
      ]),
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80).saturation(2.0),
        Text("Oversaturated").font(12),
      ]),
    ]),
  };
}
