/**
 * ColorMultiply modifier test definitions
 * Must match Swift ColorMultiplyTests.swift
 */
import { Node, HStack, VStack, Color, Image, Text } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generateColorMultiplyTests(): Record<string, Node> {
  return {
    "modifier.color-multiply.variations": HStack(16, undefined, [
      VStack(8, undefined, [Color("#FFFFFF").frame(60, 60), Text("Original").font(10)]),

      VStack(8, undefined, [
        Color("#FFFFFF").frame(60, 60).colorMultiply("#FF3B30:#FF453A"),
        Text("Red").font(10),
      ]),

      VStack(8, undefined, [
        Color("#FFFFFF").frame(60, 60).colorMultiply("#34C759:#30D158"),
        Text("Green").font(10),
      ]),

      VStack(8, undefined, [
        Color("#FFFFFF").frame(60, 60).colorMultiply("#007AFF:#0A84FF"),
        Text("Blue").font(10),
      ]),
    ]),

    "modifier.color-multiply.on-image": HStack(16, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80),
        Text("Original").font(10),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID)
          .resizable()
          .frame(80, 80)
          .colorMultiply("#FF3B30:#FF453A"),
        Text("Multiplied").font(10),
      ]),
    ]),
  };
}
