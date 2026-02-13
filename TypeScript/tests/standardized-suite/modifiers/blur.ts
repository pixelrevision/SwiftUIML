/**
 * Blur modifier test definitions
 * Must match Swift BlurTests.swift
 */
import { Node, HStack, VStack, LinearGradient, Text, Image } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

const bundleId = TEST_BUNDLE_ID;

const gradientColors = [
  "#FF3B30:#FF453A",
  "#FF9500:#FF9F0A",
  "#FFCC00:#FFD60A",
  "#34C759:#30D158",
  "#007AFF:#0A84FF",
  "#5856D6:#5E5CE6",
];

export function generateBlurTests(): Record<string, Node> {
  return {
    "modifier.blur.variations": HStack(16, undefined, [
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("0").font(10),
      ]).blur(0),

      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("2").font(10),
      ]).blur(2),

      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("5").font(10),
      ]).blur(5),

      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("10").font(10),
      ]).blur(10),
    ]),

    "modifier.blur.on-image": HStack(16, undefined, [
      VStack(8, undefined, [
        Image("generated-image", bundleId).resizable().frame(70, 70),
        Text("Sharp").font(10),
      ]),

      VStack(8, undefined, [
        Image("generated-image", bundleId).resizable().frame(70, 70).blur(5),
        Text("Blurred").font(10),
      ]),
    ]),
  };
}
