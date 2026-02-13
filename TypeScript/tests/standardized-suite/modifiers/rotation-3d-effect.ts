/**
 * Rotation3DEffect modifier test definitions
 * Must match Swift Rotation3DEffectTests.swift
 */
import { Node, HStack, VStack, Color, Text } from "../../../src/index";

export function generateRotation3DEffectTests(): Record<string, Node> {
  return {
    "modifier.rotation-3d-effect.x-axis": HStack(16, undefined, [
      VStack(8, undefined, [
        Color("#5856D6:#5E5CE6").frame(60, 60).rotation3DEffect(0, { x: 1, y: 0, z: 0 }),
        Text("0°").font(10),
      ]),
      VStack(8, undefined, [
        Color("#5856D6:#5E5CE6").frame(60, 60).rotation3DEffect(30, { x: 1, y: 0, z: 0 }),
        Text("30°").font(10),
      ]),
      VStack(8, undefined, [
        Color("#5856D6:#5E5CE6").frame(60, 60).rotation3DEffect(60, { x: 1, y: 0, z: 0 }),
        Text("60°").font(10),
      ]),
      VStack(8, undefined, [
        Color("#5856D6:#5E5CE6").frame(60, 60).rotation3DEffect(90, { x: 1, y: 0, z: 0 }),
        Text("90°").font(10),
      ]),
    ]),

    "modifier.rotation-3d-effect.y-axis": HStack(16, undefined, [
      VStack(8, undefined, [
        Color("#FF9500:#FF9F0A").frame(60, 60).rotation3DEffect(0, { x: 0, y: 1, z: 0 }),
        Text("0°").font(10),
      ]),
      VStack(8, undefined, [
        Color("#FF9500:#FF9F0A").frame(60, 60).rotation3DEffect(30, { x: 0, y: 1, z: 0 }),
        Text("30°").font(10),
      ]),
      VStack(8, undefined, [
        Color("#FF9500:#FF9F0A").frame(60, 60).rotation3DEffect(60, { x: 0, y: 1, z: 0 }),
        Text("60°").font(10),
      ]),
      VStack(8, undefined, [
        Color("#FF9500:#FF9F0A").frame(60, 60).rotation3DEffect(90, { x: 0, y: 1, z: 0 }),
        Text("90°").font(10),
      ]),
    ]),
  };
}
