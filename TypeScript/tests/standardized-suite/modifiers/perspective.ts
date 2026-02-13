/**
 * Perspective modifier test definitions
 * Must match Swift PerspectiveTests.swift
 */
import { Node, HStack, VStack, Color, Image, Text } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generatePerspectiveTests(): Record<string, Node> {
  return {
    "modifier.perspective.variations": HStack(16, undefined, [
      VStack(8, undefined, [
        Color("#34C759:#30D158")
          .frame(60, 60)
          .rotation3DEffect(45, { x: 0, y: 1, z: 0 })
          .perspective(1.0),
        Text("1.0").font(10),
      ]),
      VStack(8, undefined, [
        Color("#34C759:#30D158")
          .frame(60, 60)
          .rotation3DEffect(45, { x: 0, y: 1, z: 0 })
          .perspective(0.5),
        Text("0.5").font(10),
      ]),
      VStack(8, undefined, [
        Color("#34C759:#30D158")
          .frame(60, 60)
          .rotation3DEffect(45, { x: 0, y: 1, z: 0 })
          .perspective(0.2),
        Text("0.2").font(10),
      ]),
    ]),

    "modifier.perspective.on-image": HStack(16, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID)
          .resizable()
          .frame(70, 70)
          .rotation3DEffect(45, { x: 0, y: 1, z: 0 })
          .perspective(1.0),
        Text("1.0").font(10),
      ]),
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID)
          .resizable()
          .frame(70, 70)
          .rotation3DEffect(45, { x: 0, y: 1, z: 0 })
          .perspective(0.3),
        Text("0.3").font(10),
      ]),
    ]),
  };
}
