/**
 * Grayscale modifier test definitions
 * Must match Swift GrayscaleTests.swift
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

export function generateGrayscaleTests(): Record<string, Node> {
  return {
    "modifier.grayscale.variations": HStack(16, undefined, [
      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("0.0").font(10),
      ]).grayscale(0.0),

      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("0.25").font(10),
      ]).grayscale(0.25),

      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("0.5").font(10),
      ]).grayscale(0.5),

      VStack(8, undefined, [
        LinearGradient(gradientColors).frame(60, 100),
        Text("1.0").font(10),
      ]).grayscale(1.0),
    ]),

    "modifier.grayscale.on-image": HStack(20, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80),
        Text("Color").font(12),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80).grayscale(1.0),
        Text("Grayscale").font(12),
      ]),
    ]),
  };
}
