/**
 * ColorInvert modifier test definitions
 * Must match Swift ColorInvertTests.swift
 */
import { Node, HStack, VStack, Color, Text, Image } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generateColorInvertTests(): Record<string, Node> {
  return {
    "modifier.color-invert.basic": HStack(20, undefined, [
      VStack(8, undefined, [Color("#FF3B30:#FF453A").frame(100, 100), Text("Original").font(12)]),

      VStack(8, undefined, [
        Color("#FF3B30:#FF453A").frame(100, 100).colorInvert(),
        Text("Inverted").font(12),
      ]),
    ]),

    "modifier.color-invert.on-image": HStack(20, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80),
        Text("Original").font(12),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80).colorInvert(),
        Text("Inverted").font(12),
      ]),
    ]),
  };
}
