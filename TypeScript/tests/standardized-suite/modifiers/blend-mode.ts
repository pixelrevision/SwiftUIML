/**
 * BlendMode modifier test definitions
 * Must match Swift BlendModeTests.swift
 */
import {
  Node,
  VStack,
  HStack,
  ZStack,
  Color,
  Image,
  Text,
  LinearGradient,
} from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

const bundleId = TEST_BUNDLE_ID;

export function generateBlendModeTests(): Record<string, Node> {
  return {
    "modifier.blend-mode.variations": VStack(16, undefined, [
      HStack(16, undefined, [
        VStack(4, undefined, [
          ZStack(undefined, [
            Color("#FF3B30:#FF453A"),
            Image("generated-image", bundleId).resizable().blendMode("normal"),
          ]).frame(70, 70),
          Text("Normal").font(10),
        ]),

        VStack(4, undefined, [
          ZStack(undefined, [
            Color("#FF3B30:#FF453A"),
            Image("generated-image", bundleId).resizable().blendMode("multiply"),
          ]).frame(70, 70),
          Text("Multiply").font(10),
        ]),

        VStack(4, undefined, [
          ZStack(undefined, [
            Color("#FF3B30:#FF453A"),
            Image("generated-image", bundleId).resizable().blendMode("screen"),
          ]).frame(70, 70),
          Text("Screen").font(10),
        ]),
      ]),

      HStack(16, undefined, [
        VStack(4, undefined, [
          ZStack(undefined, [
            Color("#FF3B30:#FF453A"),
            Image("generated-image", bundleId).resizable().blendMode("overlay"),
          ]).frame(70, 70),
          Text("Overlay").font(10),
        ]),

        VStack(4, undefined, [
          ZStack(undefined, [
            Color("#FF3B30:#FF453A"),
            Image("generated-image", bundleId).resizable().blendMode("darken"),
          ]).frame(70, 70),
          Text("Darken").font(10),
        ]),

        VStack(4, undefined, [
          ZStack(undefined, [
            Color("#FF3B30:#FF453A"),
            Image("generated-image", bundleId).resizable().blendMode("lighten"),
          ]).frame(70, 70),
          Text("Lighten").font(10),
        ]),
      ]),
    ]).padding(10),

    "modifier.blend-mode.color-dodge": ZStack(undefined, [
      LinearGradient(["#007AFF:#0A84FF", "#5856D6:#5E5CE6"]).frame(150, 100),
      Image("generated-image", bundleId).resizable().frame(100, 100).blendMode("colorDodge"),
    ]),
  };
}
