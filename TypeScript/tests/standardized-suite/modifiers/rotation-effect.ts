/**
 * RotationEffect modifier test definitions
 * Must match Swift RotationEffectTests.swift
 */
import { Node, HStack, VStack, Color, Image, Text } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generateRotationEffectTests(): Record<string, Node> {
  return {
    "modifier.rotation-effect.variations": HStack(16, undefined, [
      VStack(8, undefined, [
        Color("#FF3B30:#FF453A").frame(60, 40).rotationEffect(0),
        Text("0°").font(10),
      ]),
      VStack(8, undefined, [
        Color("#FF3B30:#FF453A").frame(60, 40).rotationEffect(45),
        Text("45°").font(10),
      ]),
      VStack(8, undefined, [
        Color("#FF3B30:#FF453A").frame(60, 40).rotationEffect(90),
        Text("90°").font(10),
      ]),
      VStack(8, undefined, [
        Color("#FF3B30:#FF453A").frame(60, 40).rotationEffect(180),
        Text("180°").font(10),
      ]),
    ]),

    "modifier.rotation-effect.on-image": HStack(20, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(70, 70),
        Text("0°").font(10),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(70, 70).rotationEffect(45),
        Text("45°").font(10),
      ]),
    ]),
  };
}
