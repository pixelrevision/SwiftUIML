/**
 * LuminanceToAlpha modifier test definitions
 * Must match Swift LuminanceToAlphaTests.swift
 */
import { Node, HStack, VStack, ZStack, Color, Image, Text } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generateLuminanceToAlphaTests(): Record<string, Node> {
  return {
    "modifier.luminance-to-alpha.basic": HStack(20, undefined, [
      ZStack(undefined, [
        Color("#FF3B30:#FF453A").frame(100, 150),
        VStack(4, undefined, [
          Text("Light").foregroundColor("#FFFFFF").font(20).bold(),
          Text("Dark").foregroundColor("#000000").font(20).bold(),
        ]),
      ]),
      ZStack(undefined, [
        Color("#FF3B30:#FF453A").frame(100, 150),
        VStack(4, undefined, [
          Text("Light").foregroundColor("#FFFFFF").font(20).bold(),
          Text("Dark").foregroundColor("#000000").font(20).bold(),
        ]).luminanceToAlpha(),
      ]),
    ]),

    "modifier.luminance-to-alpha.on-image": HStack(20, undefined, [
      ZStack(undefined, [
        Color("#007AFF:#0A84FF").frame(80, 80),
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(70, 70),
      ]),
      ZStack(undefined, [
        Color("#007AFF:#0A84FF").frame(80, 80),
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(70, 70).luminanceToAlpha(),
      ]),
    ]),
  };
}
